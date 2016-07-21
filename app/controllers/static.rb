require 'byebug'
get '/' do
	@urls = Url.all
	if params[:error].present?
		@errormsg = params[:error]
	end
  erb :"static/index"
end

post '/urls' do
	url = Url.create(long_url: params['long_url'], count: 0)
	if url.invalid?
		url.errors.full_messages[0].to_json
	else
		url.to_json
	end
end

get '/:short_url' do
	url = Url.find_by(short_url: params["short_url"])
	url.add_count
	url.save
	longlink = url.long_url
	redirect longlink
end
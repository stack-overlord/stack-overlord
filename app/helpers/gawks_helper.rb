module GawksHelper
  def broadcast(mash, partial_gawk)
    firebase = Firebase::Client.new('https://blazing-fire-7163.firebaseio.com/')
    firebase.set(mash, data: partial_gawk[0])
  end
end

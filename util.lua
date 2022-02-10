function NetworkIsEntityOwner(entity)
  return NetworkGetEntityOwner(entity) == PlayerId()
end
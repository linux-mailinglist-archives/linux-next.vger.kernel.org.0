Return-Path: <linux-next+bounces-2219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9F8BF683
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 08:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DEE1F23554
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 06:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2A917C72;
	Wed,  8 May 2024 06:46:32 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54021A2C15;
	Wed,  8 May 2024 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715150792; cv=none; b=l36uePMadTm9yIF3KlBObyNd/vwKo5pmxUZvD81zbBb9R8ShGZnJLfYKz7PGFkE9CTGIqxEzQcqDI9UVu3xeCG+jvnriRkho7rPx4TN6LowejWYLeOvLD1QHw56+VWth+1nCRium+HHkb0U+t6kcLEO+ZjESGvTsmWbeh3qjROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715150792; c=relaxed/simple;
	bh=/9iUQd0KwmtcyvBo9OwzhUQWh2nlOdcUaK4LB0vP+wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDxN/C9CFdDxnwndmHoMddaL53tvQJnV6Nj+nvFvlqcBNwgvsX91ZbckqkInatmaf4ybm/Q8ZWbzKxEXraeoHnlac4lp6jY19OrKGzzxIYphTO1Pn7BhCPJX5f1oXv3Yj3dlguK1Ywyv+303oAjHaiq/JCSvn8mfJCQYKK/gelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6EB9B227A87; Wed,  8 May 2024 08:46:18 +0200 (CEST)
Date: Wed, 8 May 2024 08:46:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the
 vfs-brauner tree
Message-ID: <20240508064617.GA10736@lst.de>
References: <20240508130207.3d83702f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508130207.3d83702f@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks Stephen,

the merge looks good to me.



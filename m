Return-Path: <linux-next+bounces-6145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B5A793B4
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 19:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF3B1894198
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 17:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8734016DEB3;
	Wed,  2 Apr 2025 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+qjFAMs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FE33993;
	Wed,  2 Apr 2025 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614425; cv=none; b=uAwAwTfSAqcWE5Un2izkX/6/SbBnRJv3idDAxIJI2Yt6Guq2yMUTCm5on0EEhNsuVgITwA5T7fnXVQEoy6usTNgZwQkIgf1m5vN/aOl+I2Qj+rTVQsjU2jvwsk55ZmP1PhbYwlyLNfPitK4ucp2rEJK8bAOqEoggwEeYo00cf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614425; c=relaxed/simple;
	bh=ARkWPTneha6aLmXSvrGnF6uhfv/6LtE9EzJDxX/VM6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6civGeYWMAJNXWQnnEBO7dQfELqYPcNoXBHMiJO2EVoI0Gty3vHbP0GfI+3g+HDjvEKJ2hY/tkQ+IIGphVJCwAJYJbkSIYlo/QMk9LyP0VDNy7kC6IDnNxQs630mGcojvp8AXmB5dK4zYVDfcXb+ynq9s6CVgZyL/RpE4AIYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+qjFAMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E30C4CEDD;
	Wed,  2 Apr 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743614422;
	bh=ARkWPTneha6aLmXSvrGnF6uhfv/6LtE9EzJDxX/VM6g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=F+qjFAMs1+K82IxmFxXr3WbwC9FRq8eVFeSS4wQtW/CNa2PRakUd8ifTDuPaBFVBb
	 rbZePb+V4ZYS4gdPizbVx8N0HYxRbxO2DvLhlmcLPYnpRb5jq4K+YFUKAGBPZMnPZA
	 8cQ9TpGAwZ3pUbapHmugGnJIb+BaKbK/Lpd7R/816GkCRvb1Nh2HEzzcWHZHfCY7+G
	 JjYPTHLIGKzY+6o8ceD5Y9LUi+LIw0OAngWHENaztDm5JqJAm9w8g0sHKvamEIucaa
	 yqZREe9YEttIknmkTZS7BjXMMpqntnLJblrPd1AG9Z9wtQdZkPRCe6GsimzXFP2fwt
	 XBpWNwBqYtKnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6371ECE079A; Wed,  2 Apr 2025 10:20:22 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:20:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Dave Jiang <dave.jiang@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <b26c96af-8856-4bdf-9b43-dd225cdaab6c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
 <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
 <20250402114722.35cbd9d5@canb.auug.org.au>
 <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
 <ce38cbe3-429d-466b-bc8c-7dbb7c596ab9@linux.ibm.com>
 <20250402114412.GA342109@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402114412.GA342109@nvidia.com>

On Wed, Apr 02, 2025 at 08:44:12AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 02, 2025 at 11:57:04AM +0530, Venkat Rao Bagalkote wrote:
> > > So the various kernel-build howtos will be updated?  Or is a patch
> > > forthcoming?
> 
> I was going to pick up Dan's patch after the merge window closes

Very good, thank you!

> > FYI, now the issue is on the main line kernel also.
> 
> I thought the header test stuff was disabled now?? How are people
> hitting this?

For me, an allmodconfig build hits it every time unless I have the
libuuid-devel package installed.

							Thanx, Paul


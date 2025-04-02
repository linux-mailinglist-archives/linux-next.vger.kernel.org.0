Return-Path: <linux-next+bounces-6140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57531A78730
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 06:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149E816DDF4
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 04:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1402C230D0F;
	Wed,  2 Apr 2025 04:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwzBHp7Z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2B230D08;
	Wed,  2 Apr 2025 04:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743567712; cv=none; b=HCzuWq6ZzkW2V4/9djacZQX5cr8HfaNee5ZQTO8vUuvE/rj3cOD1N3ahttJT+9Ef0zuGH7ycx6r2FUvAIBf24MDIXvH+zL9WOLAr/Lk149rZbM2uN8tCHhmZDoOA6bKshYDoUPxn/ZbA3Zq4PVMoCdlvDsiU0E58i71G7Jv3pDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743567712; c=relaxed/simple;
	bh=m0SY0aMz6VYqx7I6tJ28nDq+/OGv6gq3bFTK7dq4V6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+iZOnt/77fAnKzh0M+zjZx/0x86yhl5uazCrYGy+kjqCW0Lp3lNPsi85D3NmzIDBiLzhOeC7kuvTx/VxP8I1iXWrcl1IU3oHnT//+J316JoC2EJyOk0/cDl03zSMKj3QFcxL9L1S1GTflcaSUK8gGeVP2ZXpSD504GU7XctmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwzBHp7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFCDC4CEDD;
	Wed,  2 Apr 2025 04:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743567711;
	bh=m0SY0aMz6VYqx7I6tJ28nDq+/OGv6gq3bFTK7dq4V6U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LwzBHp7ZxYE3JDyc5xbuPO/aTzibLn5bXlb275iEVz8lnt+aPR2Gm9F0XHp75mrDt
	 ASTMnXRoZE3jm5l3l1+13EKaQ9wWhWmPUPS2RP4eOk+hSSNz/s/npXp8odcaDC7Vzy
	 AVZ58stfxu2KUXJYzcSUNHYTxxpHNLw+n0D86dZIuc5q1xtW8vrTbITgxN3XJBuV/C
	 gnMu8JAukWxJOebacn/G5H+WEKU8045UyFJ8uUhzmx5h/yNgNenK8Zf0sapFdZ73nr
	 uAWhq0W0VTIJc5LoHGSRsUlxkYGwmbB0tofIYUo8L6rOlDsqIcdQ4WhCLse+lSKlLD
	 X0p0Tga44OAuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ED877CE160D; Tue,  1 Apr 2025 21:21:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 21:21:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
 <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
 <20250402114722.35cbd9d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402114722.35cbd9d5@canb.auug.org.au>

On Wed, Apr 02, 2025 at 11:47:22AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 1 Apr 2025 17:18:23 -0700 Dave Jiang <dave.jiang@intel.com> wrote:
> >
> > > I of course do have some concerns about the number of userspace packages
> > > that might be required if CXL is adding seven of them...  ;-)  
> > 
> > Technically it's only 1 package. libuuid-devel. Do the other 6 come
> > with the installation of libuuid-devel?
> 
> On my debian build machine, I only need uuid-dev and libuuid1 installed ...

And libuuid-devel works on my Fedora systems.

So the various kernel-build howtos will be updated?  Or is a patch
forthcoming?

							Thanx, Paul


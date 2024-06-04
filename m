Return-Path: <linux-next+bounces-2458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF18FA6E8
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 02:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7464E1C218CE
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 00:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110B110F1;
	Tue,  4 Jun 2024 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rduXa3mU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F02A5F;
	Tue,  4 Jun 2024 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717460399; cv=none; b=Sf+hfipZ5Ny99QkZogDh1qxRv+F99cgVSLXNbulpeBZsclBuwF7oJ6gnAOUTU+14BmSLkDCP5boSczCXY3nhnUasEmLoKic49lZUzFvqaZyPeSoL1ChpIv3jx5qTf7JJzS25sRwhvMWA7AHJxDdHyxtCUZpvhZ1tYnsC+S8BUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717460399; c=relaxed/simple;
	bh=BMoF7J99zKFVpn0nM3A/va9d59DByhwsOxGR9qU6aXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMQgJ2j1QJrxy9QXCtBYZdW4VKbnnahzYBvbx9TkmMsf3wt8TvVCkpTzSnq1ay3gnsLvLACWQmzL+VFvcqB/DLHakM/RbhJcbmJ0Bc9uBPkSROkHyWse20wAtxiBJ5LsKyg3RGVbUGLb08mWBVxoVK8yyqsQCglFVz6dHvCb3is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rduXa3mU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FCAC2BD10;
	Tue,  4 Jun 2024 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717460398;
	bh=BMoF7J99zKFVpn0nM3A/va9d59DByhwsOxGR9qU6aXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rduXa3mUHV2RZB/p8YWiwFD7OzVROM8+GCTtGqWOg5ngAzVETcZ5a2m1J3jB74I4S
	 blgxyhyZ3+Wiu52PhOEVZUL+dMVtKFWh8eu92Gm57NfJh46y0KV+180S0ZXZFEgjn4
	 07kN5DZUPJ6QSgVTbk0eFB42pPKZCD5MtaMpFchmT5e/HONrPzJWrlOcyYhbSZhIMR
	 sAhIIxKRC68XCcb67ZUQJDlKWE+JL+/TA282sgxl77g6yZ65Xia4iTDL0j1zTJ3mNU
	 EZPKY8Qo2gqdhdykxIUcZitdK8CVGCGo9mGRwYdXESnit3Uh5QC73D/O1nYPHA9dE8
	 QliKhT+Gxs8VA==
Date: Mon, 3 Jun 2024 17:19:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240603171957.11cb069f@kernel.org>
In-Reply-To: <20240604100207.226f3ac3@canb.auug.org.au>
References: <20240531152223.25591c8e@canb.auug.org.au>
	<20240604100207.226f3ac3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Jun 2024 10:02:07 +1000 Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 31 May 2024 15:22:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the net-next tree, today's linux-next build (x86_64
> > modules_install after an x86_64 allmodconfig build) failed like this:
> > 
> > depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_devlink -> rvu_nicpf
> > depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_dcbnl -> rvu_nicpf
> > depmod: ERROR: Cycle detected: otx2_ptp
> > depmod: ERROR: Cycle detected: ptp
> > depmod: ERROR: Found 3 modules in dependency cycles!
> > 
> > Caused by commit
> > 
> >   727c94c9539a ("ethernet: octeontx2: avoid linking objects into multiple modules")
> > 
> > I have reverted that commit for today.  
> 
> Any fix for this yet?

Arnd, do you have cycles to take a look? I don't unfortunately, if you
don't either perhaps revert for now?


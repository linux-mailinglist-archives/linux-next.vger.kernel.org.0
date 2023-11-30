Return-Path: <linux-next+bounces-171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D97FFEC0
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 23:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79522814EE
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7397830334;
	Thu, 30 Nov 2023 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CsVIFbK8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592405FEE3
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 22:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA2EC433C8;
	Thu, 30 Nov 2023 22:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701384772;
	bh=3Pjy/K2UERmUE9Lf5OSdmJ9hD0GKJkBFKQQACti98iE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CsVIFbK84G7b2Vl8DXsPn+xC+ko6DzsEYdCpeoLL49f/wjG0q7+XJFA8Efc8EDrLB
	 kWNBU0rp11lJIwEumnlUF0vW1QFCt/iSvb53/VZenYE6vQugSPGW+tCvDkbxMuIybt
	 NjkhWJl8mlNRuK5K9LKmAwQg0Qj5GbFQr6QhmUwg=
Date: Thu, 30 Nov 2023 14:52:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
In-Reply-To: <87sf4m27dz.fsf@mail.lhotse>
References: <20231127132809.45c2b398@canb.auug.org.au>
	<20231127144852.069b2e7e@canb.auug.org.au>
	<20231201090439.7ae92c13@canb.auug.org.au>
	<87sf4m27dz.fsf@mail.lhotse>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 01 Dec 2023 09:39:20 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:

> > I am still carrying this patch (it should probably go into the mm
> > tree).  Is someone going to pick it up (assuming it is correct)?
> 
> I applied it to my next a few days ago, but I must have forgotten to
> push. It's in there now.

I'll keep a copy in mm.git, to keep the dependencies nice.  I added
your acked-by.


Return-Path: <linux-next+bounces-4300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AE9A026F
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 09:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC37F1C26298
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 07:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC231BAED6;
	Wed, 16 Oct 2024 07:23:47 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DC1B218C;
	Wed, 16 Oct 2024 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063427; cv=none; b=bv0NlKv71CTuTGT//bsX/8CN0alvcP+FiEMhH3sGExMba1bvd48oVPEgVIak5ZSqtWbDZLt4mkF0qb8pVOr79WaTm9L1GdHFC57FWcpNHGb254vmqnrmMvdyGJptCspf9RXPm/+neNtFlvxB3P9mlxeezobzKcEDgXQ35CNli4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063427; c=relaxed/simple;
	bh=3mhhQeRZzFy93M6QNqG7MjgsAGWHBt3NIGOYnoFlqWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulNUBv3PnpSRCn5Vovc+mSNROvygC39QS61lydSOrl0ZIlC/0olXSh9+JEfGFJnNNQHJCBkC0mvaqLkp4/h1C9HqyCXW68s0R5GntcfBFANGDJYNN59D6hBzlbEAAoUK5k5DhnKdOH6F/LR3aE5WFHJO3OH8g8sUuY7l6hvF3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=54080 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t0yNV-00BKfy-BP; Wed, 16 Oct 2024 09:23:31 +0200
Date: Wed, 16 Oct 2024 09:23:27 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>,
	NetFilter <netfilter-devel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ipvs-next tree
Message-ID: <Zw9p7_31EESN64RQ@calendula>
References: <20241016115741.785992f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016115741.785992f1@canb.auug.org.au>
X-Spam-Score: -1.8 (-)

On Wed, Oct 16, 2024 at 11:57:41AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the netfilter-next tree as different
> commits (but the same patches):
> 
>   3478b99fc515 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
>   73e467915aab ("netfilter: nf_tables: replace deprecated strncpy with strscpy_pad")
>   0398cffb7459 ("netfilter: nf_tables: Fix percpu address space issues in nf_tables_api.c")
>   cb3d289366b0 ("netfilter: Make legacy configs user selectable")
> 
> These are commits
> 
>   08e52cccae11 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
>   544dded8cb63 ("netfilter: nf_tables: replace deprecated strncpy with strscpy_pad")
>   0741f5559354 ("netfilter: nf_tables: Fix percpu address space issues in nf_tables_api.c")
>   6c959fd5e173 ("netfilter: Make legacy configs user selectable")
> 
> in the netfilter-next tree.
> 
> These have already caused an unnecessary conflict due to further commits
> in the ipvs-next tree.  Maybe you could share a stable branch?

That was the result of a rebase, moving forward I will keep PR in a
separated branch until they are merged upstream to avoid this
situation.


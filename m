Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D940104E18
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 09:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKUIgp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 03:36:45 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54112 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUIgp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 03:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8yuhHKa2tv0IroxhcfR79s+SBVyzCtZ3ViQc9dMEjNk=; b=Wlpnle+IlnxsOWdlTWbL6jPPW
        MPfdTk2/2kqtzygaPQiLheJvJkFLb858gPiGtRyT82X1Sb0YJ2hdi8uFL2qVXXLWAgi65yzcyntww
        KDwVXdhfzn2Q3eLaePbPkN6AI1vgyRzA8DUvN7lvQmVGE61iMrufv2nqFO2aGm6KiWt4rg5FP1IIg
        R544lY3CmLXbHbAUADEnfbYLPO2xO3IEhhMqiN+rAjXTDAwTMYGSASGWB0iGW/4CWkyZD6QMBgNv7
        zuFM+jFgBsNNpSB8Iys/mXKS1a73EyCCWGPQWv2zhQ1/VahRLQq0DZWAK+TY4gw9BGottFYoMbwIm
        HffGAIk2g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iXhx9-0004Wp-Ib; Thu, 21 Nov 2019 08:36:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7DB1630068E;
        Thu, 21 Nov 2019 09:35:26 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2DED12B28AC3E; Thu, 21 Nov 2019 09:36:37 +0100 (CET)
Date:   Thu, 21 Nov 2019 09:36:37 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191121083637.GM4097@hirez.programming.kicks-ass.net>
References: <20191121145403.46789cb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline
In-Reply-To: <20191121145403.46789cb5@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2019 at 02:54:03PM +1100, Stephen Rothwell wrote:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index f940526c5889..63e734a125fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -473,7 +473,7 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>  	    TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
>  	    TP_ARGS(sched_job, fence),
>  	    TP_STRUCT__entry(
> -			     __string(ring, sched_job->base.sched->name);
> +			     __string(ring, sched_job->base.sched->name)
>  			     __field(uint64_t, id)
>  			     __field(struct dma_fence *, fence)
>  			     __field(uint64_t, ctx)

Correct, ';' there is invalid and now results in very verbose compile
errors :-)

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAl3WTJUACgkQdkfhpEvA
5LpZMw//RHTmbvHg8d+lchE5r0wyI+WJWr159P2CxPxKKfZ92bMxqbFMTqlB9ZH/
6NWvhi2+bfMFiUL408h9HdRmuxzH2Op+x2I3JtekG2r3ckjV2pQ0VPQePeMdFndu
YfRRyB1Sce3TGGmDd7Mx9YVcnhBFDV1AZxmZtiwaYTreb+4+8DYgniy2MYL1GaXu
pDqkF3UcJlHYZef7ua9/Kgq25S+Wq6DS67oFe4lecctMVKmIIngKsHxg2XAYgRbz
ajwNgjXCPFEnakbiHek2jUb9gn+zYK3903rF4cf5/PH2vShCFaRKkM+xy5qIWoem
4u5D8eGRgmc9UlRq2SEKdbFS3CUTCYqoMVCSouL5TBiQThL9BlohGdlgaAn5gcwl
rWCaOGt7J1/aKTsdEHNe5QdajReoF6IesslJxJokbTBsv0ly+p0pWfN3hqi6OI4G
RqHcXLSZ2H1VNM1CoTr/5/ym3IMDIyQ9+vhbuqoRJn5diC0ZFiDLr3rieGAG7C+Q
ASHlJBDIYnee8exD6Ykcse1/gAzDqIjugvUMucutz0jo8V4M5M9F60A5scmUtIUs
d7z1DXxJARL+GMgwvW48p5uDirE97G3WlBpLHLpAq3gXBoSroujzoIqmGecCxHh9
ICKjT4LmvDWFgPuObn8bJEY7sqTEwh1Mj4fXLqk2/syPQD/uMtc=
=xHvz
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--

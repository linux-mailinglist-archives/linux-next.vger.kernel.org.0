Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5876A12F4
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 09:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfH2HrJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 03:47:09 -0400
Received: from merlin.infradead.org ([205.233.59.134]:55466 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbfH2HrJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 03:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VfCL8t+OBcNr47iwQjcm8aKmg01bRT6fUprt393rbFE=; b=RKlYtgLnNcmEBlMNdfBERNNH17
        XQZN1PTq0irN0Eed0aOQdq9CrQ05+BhXZinDz+zkVcEhU7ZQ1Bo04+JxcCOOw1hTCWW3mmDU2wDwj
        sxUO1icRtv73irjHzKaU6lPr6RwKM2rG+iiHHouc0d9HHDh8ZhN/Y+ZYxEphHdXkdf8CcL4IgVtfc
        HHLQnKxuwqjQaVuxU6pV03GRHYdZZCq1nIh7cy7gKdbf8pYLWyU/yf0pD4w3DersV1pCpP5doxMET
        RZTPV6H+vkx5RdUwKL56cgDawzcnJjjOkP3D0qdZ9JrvtbC3B3JNM2oywn0IJcd2oP/m0HiS5lKW0
        7pA2HWqg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i3F8q-0008HC-S5; Thu, 29 Aug 2019 07:46:49 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AAC5B30775B;
        Thu, 29 Aug 2019 09:46:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B48C420C743FC; Thu, 29 Aug 2019 09:46:44 +0200 (CEST)
Date:   Thu, 29 Aug 2019 09:46:44 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mac Chiang <mac.chiang@intel.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20190829074644.GL2369@hirez.programming.kicks-ass.net>
References: <20190829162012.36ac9d7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829162012.36ac9d7c@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 04:20:12PM +1000, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Aug 2019 16:08:49 +1000
> Subject: [PATCH] ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_M=
OBILE -> INTEL_FAM6_KABYLAKE_L change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  sound/soc/intel/common/soc-intel-quirks.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/=
common/soc-intel-quirks.h
> index e6357d306cb8..863a477d3405 100644
> --- a/sound/soc/intel/common/soc-intel-quirks.h
> +++ b/sound/soc/intel/common/soc-intel-quirks.h
> @@ -36,7 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
>  SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
>  SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
>  SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
> -SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
> +SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);

ARGHH... rebase again?

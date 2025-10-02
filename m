Return-Path: <linux-next+bounces-8535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA42BB3CD3
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 13:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C951F17F6F4
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 11:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742DD30FC26;
	Thu,  2 Oct 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2DMGCvs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A727FB05
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759405422; cv=none; b=ALK1Z08ILdd8ewRIvjCKy9X7S9b/KLAv0U+KOljxbkWIQ1XnhgW4oYt/izcIq+YyURj/rS8baNEtszDbX4+tS3HLNHGymRaiEfww58gfU9/AdlOak+VF/CuBjJT2rsflmPPGTlR1ki0hNhfsXp+PM3ZwgmlSe/FmhQp7hKLWQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759405422; c=relaxed/simple;
	bh=mQfFH9dlJp1wY8DjH+FxPFbokocVbPKCKSkod2iQXeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ1knNqsz0wRyIgEjM8hq1JJuqEw6I3EiLy41GEM0sBrPX6K81QkoxG2IuWMZafg/VymkPu04fZCdgZ4jGCpcqy3zECrjfkTUqqooFIvpKVIjQgkSfOq5rdvuwFp23Feh5Su6ip/bcJgc2SPfnkCaGIc4eNxbxHnod/CWs+M1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2DMGCvs; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3349a142fd3so91060a91.2
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759405420; x=1760010220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fPGwrtnmwO7ynHj83uEKbgoWVEyH11Eo31+uKIXnVKM=;
        b=c2DMGCvskVg1WNvg36gWoxlnKNn2hydXSi9XvCJsrYflp60ocIMwcVpJU7q6p2/6cv
         QVusEEzRjVpC1i/dDWT/QIpIpMi+G7RDYbhiAMOQg+DR9Uwyf82t1sVQ9XSzazUMqbKE
         b3jd30ljHa3THWNLwIC5yX3cy7J24AvSFeIRS2vg+SdVE5Y3CJybPdPKrupQ70X0RHAk
         ioLjMNOfWA6OYzbuoQty/51GgSOxU40La9CGWGQaqPptdRLCI7Kuc5l9jzNonm3cAFd0
         vgWxmFFBM/4uP0lEWGpwj5Zu2cRSXmg54Sc1nSrpgt7Sj21XeiCD4DW6TurwN667k40Z
         SMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759405420; x=1760010220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPGwrtnmwO7ynHj83uEKbgoWVEyH11Eo31+uKIXnVKM=;
        b=iqVXj+QHyXllRur0pUcA6uVwKvEGI8S8X7RWL9b8OnTc7axr9oUeugax6XIUDBHU30
         5P1oAYGuPQXmsd5IxIxR6HGXh09n1aqdSL/FdLJccAiHfe7UX1xZc3RcpqRoHDfPRFB5
         42qz1aofgvZC/dMQkv5oIGSlQIB6Zzmga/FBMB7r4nsNWWpsPn834hqZIHjR1VzhkSE4
         XAXtLb2z+RdZqbvmpck3hKB7uqe3+6qw6EdVD1HPy7n1uc02J2oAl9yeu4xKWxEZNeLn
         PhRzmgGii2IrTqALi2xCIbndOvDPh6zHJZc2Bc17otrqOKbcE+Fu6DZYCfzRPHgXooXd
         Slqw==
X-Forwarded-Encrypted: i=1; AJvYcCWHYJswOHOh35CIY/R/7y8w9bayuggJwj4ijbp8PFl7bYBrQWeBQsBp0fpTv4QW77Y1FNlFNd258WoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YysmeTQFsm4evUbGS/G3gvgT7/3KHXbEBsFQVZ7LwoNHx+8ofFf
	SM+I8eNKImNEH8sSDvvne+ohNEISPKXoLagZKnao0kcQVmnh39df771evnh9USWx++HuNv4S8SO
	xMaKhqqg7gL4KnVepVvgDzNbPlW0oespwoENJXCNJ5w==
X-Gm-Gg: ASbGncvcFES7MrPBYEF25NMB5Pyl9mmE/3jOfs2wAbACjJTFOO5oWeKqQMxLHusVWnp
	vEMWM+8TOohi+kt29Etexbxxh559dTHSHpMiftyVxuMalKt2Vyhzo3qlks3akju1J/t73f1ervY
	H++/LsQygRBUCRdyZXumktzP9++5sNm7xadRUH89yPlUQHUqL2a7YarODafCBbszBcPWt0mzyml
	kG+1OiimigqSEnuxpmdpXtevALFcw0p9Q==
X-Google-Smtp-Source: AGHT+IHcS+PZDBFklSeMqhkIhlvfggeUxgT2umZ0JZAsg1sGRTLRThuGm8GszRQtZPIo4KSErXn2dh0dbaFyqtNReGs=
X-Received: by 2002:a17:90b:380a:b0:32e:914b:f709 with SMTP id
 98e67ed59e1d1-339a6f3eeadmr4428470a91.6.1759405420125; Thu, 02 Oct 2025
 04:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN5bct_vDSzAfcnu@sirena.org.uk>
In-Reply-To: <aN5bct_vDSzAfcnu@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 2 Oct 2025 20:43:28 +0900
X-Gm-Features: AS18NWDE982m00ruoRWCyOyxgNeTryWjfEhQfE9Z51q2R5vXRcc3l_Serfgwv0Q
Message-ID: <CAGE=qrp_vRvbnVCJ-OQQ3qspEEKqMUoDbGHpimYRBHH0NRig9Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: SeonGu Kang <ksk4725@coasia.com>, Ravi Patel <ravi.patel@samsung.com>, soc@kernel.org, 
	Linus Torvads <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 20:01, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's build of Linus' tree (arm64 defconfig) failed like this:
>
> In file included from /tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12:
> /tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error: dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
>    12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/tmp/next/build/scripts/Makefile.dtbs:132: arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dtb] Error 1
>
> Caused by commit
>
>    b176376991772 ("arm64: dts: axis: Add ARTPEC-8 Grizzly dts support")

 Thanks for the report, I already got message from Linus about it.

This will be "fixed" (not bisectable...)  by clk pull from Stephen.

I'll try to add some more tests for such cases to my CI (because
Samsung won't... ), but it's already a very busy machine. What I
wonder is that this branch was in next for two months and LKP didn't
catch it. Maybe Intel LKP cannot be fully relied on anymore?

It seems it's second missing allmodconfig from LKP this cycle (another
build failure reported by Linus for other pull request).


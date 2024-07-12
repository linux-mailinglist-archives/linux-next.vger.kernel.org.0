Return-Path: <linux-next+bounces-2963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDA92F5D4
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 09:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4F8F1C21DCA
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 07:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E306813D62F;
	Fri, 12 Jul 2024 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="bz+HyEPu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0C200A9
	for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767617; cv=none; b=UWOuJyKXuWY2b/llaMAREv6ox8SYtR/mWBxa01xgAg7gZeshZ6EnkY3/cfuN+b7iDhCYN4v/8kdk8GSJel13qRoKXa/My90mLgASL9b/+fToDQNQnOTG4YzqMpWbOhB127qO5Pj+wC2H3oc91788BA1b65ypi2sWOHpnnVhQ2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767617; c=relaxed/simple;
	bh=jCpNPan1yvg4qm2JnvhWu+glmK8+IOzpGqlGEfGS4YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6zfP//yjP1/4qZa+5Rf5gC1UetNgu+kt90Wqkvn8qGBIA38ji3zPyf76lkw4yLqRF+8UdQlBDfTeNDzmNEHl/WGjZ2mBW9vhU+kY4twbDulFDiCwdolaCbsCsb4Yi/QKvdAAEqV/nJchXz/Us3VwiWOjC3VK/i6WLpu8023tkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=bz+HyEPu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70b4a8a5587so1414512b3a.2
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720767614; x=1721372414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLOzcQxtgY1Ls90A6FAg8y/fu34jSjZXLr8QOaNq1HA=;
        b=bz+HyEPuB8+Xgg7u15sQ2CE5zpu2SUN5hA8R76AFr7PsWS4MeJedVTEaKdA98pUWO6
         x1A4oAZpLw+HkoJkvc5Z4Qyz4+PiyiLbd/2uXhSTOwZ830FiRrv5kbVChAFCzITbppLw
         AEagWpi+sfuBmYm6zrmxIdJDC7LDG7yXgvv5QwuZCAs9+5Fu+Fh4aOPqnBnC5K7J5Lri
         kggFApolr8ReO5TWQ92OS6ZH0owsCTibeqIDJW5Kg2Ng+uSJyo+RgJ6aA1sAmCS8D7aX
         Xpui1MwIf+odYcQOnlLDr9bwVasLN04KLhIr4QwzM6tZbhZ92BfQZVFWVp1h8EWrX6c4
         qQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720767614; x=1721372414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLOzcQxtgY1Ls90A6FAg8y/fu34jSjZXLr8QOaNq1HA=;
        b=WCPYf2L0bzt3iITVTy4iLcgGCegAMsiK37I8p92Grk+DQKXQIotGOHKg3XFDJDxNL/
         o/81+/SuCuwYvmXKSfgXoru3cYkCVQPGtSc9VEmw6Kzzc8qjqC9suzpvc6ZaSvEnUVW0
         39e/G9Q24d14BJlWsAj5Je1CG3dryfEF2YOJs0UBUjfsm3mTl5bwVkayS+CQTzPdSRDl
         W46lZPp4SgldAP7rxB2XhWQlXFivuUU0Te8bLjFgxAuNB1UeGzeoVtoebhurgy7gDn6Z
         mE9iIwUw8tsPJ9hm9AITKtlZEZZjCjBMOXhlce5os/cJSF7od2ug7SEz65s8wOuUzrX4
         UMag==
X-Forwarded-Encrypted: i=1; AJvYcCXNnOhp9/DQmYZAbCJJI4D75v3Jtu/fv95+psGUP3ckPvQw/VvccIjeLGLpHaZOtuWS+W+slQOO23mquGJeFfMZ4jkOSJT5PB1PoQ==
X-Gm-Message-State: AOJu0Yxi2M4YgEkrcUwGhvemvOyj5wuH/6xEIKc6FXW/bggNBqRXkJta
	ORw/n14ROZbSTaiKlvA+luhSulTVH7w52q4NCk0ijtLyFrOoA515fVINbvJEOP4=
X-Google-Smtp-Source: AGHT+IEmtd2yYJQoSBljsfSkChXU1mvTmqPJM7r+lNBjAP2ChBh/asoRVWE33A8FNfPrF2wpvJGaeA==
X-Received: by 2002:a05:6a00:1a91:b0:706:5a51:7be4 with SMTP id d2e1a72fcca58-70b4367b361mr12565830b3a.29.1720767614523;
        Fri, 12 Jul 2024 00:00:14 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:c949:fd63:7988:f01f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4396780dsm6739762b3a.111.2024.07.12.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 00:00:14 -0700 (PDT)
Date: Fri, 12 Jul 2024 00:00:12 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Drew Fustini <drew@pdp7.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Message-ID: <ZpDUfIspyPL2wbLA@x1>
References: <20240712095825.6e1224d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712095825.6e1224d9@canb.auug.org.au>

On Fri, Jul 12, 2024 at 09:58:25AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the clk tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   480d9a6083f4 ("MAINTAINERS: thead: add git tree")
> 
> from the arm-soc tree and commit:
> 
>   1037885b309c ("dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller")
> 
> from the clk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc MAINTAINERS
> index 44cff47c2594,04eb5587ffa7..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -19382,8 -19322,9 +19382,10 @@@ M:	Guo Ren <guoren@kernel.org
>   M:	Fu Wei <wefu@redhat.com>
>   L:	linux-riscv@lists.infradead.org
>   S:	Maintained
>  +T:	git https://github.com/pdp7/linux.git
> + F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>   F:	arch/riscv/boot/dts/thead/
> + F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>   
>   RNBD BLOCK DRIVERS
>   M:	Md. Haris Iqbal <haris.iqbal@ionos.com>

Thank you for fixing this up. The resolution looks good to me.

Drew


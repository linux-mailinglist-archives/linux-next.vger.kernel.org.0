Return-Path: <linux-next+bounces-9186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645CC812C7
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6A43A59E0
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B579F30C613;
	Mon, 24 Nov 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gRQELM9p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531A290D81
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996076; cv=none; b=CcHIHmLFEDsbJKGLw8uxE1nAQCC4IwW/VCG9FXz40SO1MJsHx+z2+1yN/8vHyRv1Ur+Axan4ImSODK+bTLZTdePsw3XiGyqk3UCDZq9kKjIPJFyr42oeZxCAHNF7jMg2CXDn4YKRPvy+SOjgufzx6mgukrlsYjZvyQbo4Dr1Liw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996076; c=relaxed/simple;
	bh=8KVoGgAeiDvovEoQVpCryV2tgXPCOk8LxWNfiWz72hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enbwNA5Z129MafazbUZElVodF9cY/BcURBggnT4mJ2MBfRhvAqkjdze8npIGuCy8jMI/7fHV3RHJfBnb6Oz8tczHWyt5g6hzb5tGlA4lsOix6koeBGyZNuIa/OXJuRteJ3meovgvR2oy4W3AR+ST0aLeRoNiXTHMK1ZrwgWY7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gRQELM9p; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so42307175e9.3
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 06:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996072; x=1764600872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80S2otZoH00Hdtc73G/MnFbyNrt00qfwFwGChiX3X4g=;
        b=gRQELM9p64CR0ADm+qz78Y8IUzF88a01G35yRmUBTFjObK+Wwg/taFfMvlSVfggow6
         GVQA5VmGVEb6ghn+cnvMMCQXVTG8sqUm8wHJ8xewQgPu2QYf4IyGJOdl9J0pKu0ftxMC
         /X2jf/NIOEmKKAI7QSAhWDFSHr5+T+ZoqKjXFzI3mLdXJJJyxpYpj4gFLsdLXC0Eysac
         tWipZMuvUptBXBx5Jvpv0YQCSLyEt9QvgrRBlDe3VtpB9wcCWCXGgPnVf9J+PJ1Hu/aE
         i+A6D48jwB1SSsgaj8kIZJ2CLAvjXpLpDw3T8aoIGA+FntMVs2m/tH4Zhf0CHnOw50eY
         82ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996072; x=1764600872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80S2otZoH00Hdtc73G/MnFbyNrt00qfwFwGChiX3X4g=;
        b=Gqehsg0FahlHryXEsTE0NPkTy4V6H7jQ3SC9XfMpBRRmIATvO7Mz370t5aEc3QHKuc
         k6Qh6mGhT7pjxI8o3amV2FHty6NKse2+6b3W53QEq3/EoaFzq8yJdPchlhVLeuEjdzlx
         3TmECsRR/zsoB4iVia9MZCcRiHZsZY9s2lt+FYHcnx+WlA2RsDZisFXfbXIkY0FMYOUx
         n2NNO3Fg8SYnZoJZSO2Zk1PdXlTTicxVqNzNooxAqvfmOEG8p9iN3vLKcp1ZF5ZGhL37
         M2eIa1/+InRl/o6hmIa1b4UqNaKLjkFJ+mZrmsOjAF3LmEimL53XHsFQ3lSXuiuddK+7
         ccFA==
X-Forwarded-Encrypted: i=1; AJvYcCUAE9/UVDDUR0njjVdSYH10Fwt7hyIIvkJeieC1x4dKc/p9vQRL+fiZPAewm0h9jV6O2PynSlDsxTOe@vger.kernel.org
X-Gm-Message-State: AOJu0YyjS8c1wictuqkaDr4eThKze2eQrdeMPEiHcbQdrBDWzUl7/DE5
	fmSHUP6RzIU4Fw5ODrpLPQog3rlTS9OD+ykkteNHjKGNNt4yyxxskJCgw1lPhuIMBEzVYq0qgRC
	9huhW
X-Gm-Gg: ASbGnctbVJm5U4bHbAbYlzEgeMeFVLwt59d3Dhi2IAJES4GzKIJp0zilh5pQI5m+uba
	K5gPAg/dZuGW2/9nby5YCPBu+X3DXHf0+PeMM8vc6gTC3e5gZi9pPvlm+hSMwOfXOO4AqhrUF8o
	SyvHeFQLaWGA4YdsOvAsRYlY9dgo5DzTJddViTuSO69qDbwd/12K7+IuwAxpXAz+EI24PgkS0p+
	bgbpbtm9XQ7sGI5ai6Ff4Gu0PoD9vEn7rMsjRwuc+uSX4cQCrr1yUmOZuaoyIKUcMN3LibvEMaQ
	k1+omP/2M20whrr8d1ZgxZWtaXR6ckECcMc6yI/f/qETMk+vfc02xM1j0oz45CzqsOpcMMKKbGI
	YtxWZi35grEr04WVF0ate8koM1k/MXuw79lQVMH63dIQQ2Zg7Pjk0kotCa+ThNujchhJL/viaGB
	0EVXKwzuEz1gEHWQ==
X-Google-Smtp-Source: AGHT+IE1vm6fdUBtkb2k/hgcc3nuPYIoDLMZRlQeNe3TWQcEDdNBwjmmSj2W4+7pPsgUXQ2S3YkYVg==
X-Received: by 2002:a05:600c:3b08:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-477c114df06mr124812515e9.23.1763996071822;
        Mon, 24 Nov 2025 06:54:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3ba1b4sm203422155e9.15.2025.11.24.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:54:31 -0800 (PST)
Date: Mon, 24 Nov 2025 15:54:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Ogness <john.ogness@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <aSRxpRnLELpnxBQf@pathway.suse.cz>
References: <20251124085307.30709037@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124085307.30709037@canb.auug.org.au>

On Mon 2025-11-24 08:53:07, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   863eb2c656b4 ("printk: Avoid irq_work for printk_deferred() on suspend")
> 
> Fixes tag
> 
>   Fixes: 26873eb26c45 ("printk: Avoid scheduling irq_work on suspend")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 26873e3e7f0c ("printk: Avoid scheduling irq_work on suspend")

Should be fixed now.

Thanks for report.

Best Regards,
Petr



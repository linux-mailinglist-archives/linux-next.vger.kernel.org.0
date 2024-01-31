Return-Path: <linux-next+bounces-921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A508437E4
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 08:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4B5282960
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 07:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4BC55C18;
	Wed, 31 Jan 2024 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXyVMpE5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132555C08
	for <linux-next@vger.kernel.org>; Wed, 31 Jan 2024 07:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686211; cv=none; b=tNy/4b8I7eMd4T69cQQsZ5BK/MoM7/zgZcrcqkQM0/D0DDOhgXZxe2hMqgywTiTnB3TtXPu8lxGkAZ/i9ESaR0z5XBjEmEB+8cD9gb5ivSSik/uCg901zMs/S6/3ANs1IMba+4PKhmHOc4l4Grued6pcMYPJyAXijpKkbdl2Pyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686211; c=relaxed/simple;
	bh=ZnSjuz+wCD4fFRT9TrE0JCVWtWEAeg2iVUhLFgVAbRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coYbZFp17qWRx/WM2ER7PbfWNaLNxkDd3g/q+ra1ijc+CeUhPeqDO6KZXxf+Jw47mF4PBTIygDgDKMIBf7M+f85Bw+sal8iZlKSIUdAA3RV9anOUQGj0uQNSXQo5YfbzhHj7p+tim3FzfotQUHybnHSGt2kPWffNW4s7bGS4mxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WXyVMpE5; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc61fd6ba8cso3586305276.3
        for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 23:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706686208; x=1707291008; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ORw9qKBOGoX07ffDB/zrod7QZpg4hY3LzIc7/zUZ3BY=;
        b=WXyVMpE5lznPVQPP9kXMvVqOZ5KhsPlwJZ38/9LdbzyGBsAlL2QllZXhkx3vihIvbZ
         X48paRZpvHlQRRfbEgjMwqQDKEFOR/dBH+ZbufVJrlazt8opjUmoGsGMdTUiOBbThOAw
         rL7sX31/Lz4QlSBBRJqABVXLMkDWI2JOqeYFXnj8AnLZguzZL+hyzuKZFUgZDpWB54AR
         RIhedfkB1wOSSRQj4QBNZXxnqJlmMuCJRAlq0dz4REQptmZkG4zKKWzy6jRFS4x3UFuo
         dS7KUEn4wnzOkcRmaQ4K390Pk6qu/alpxJfa7W8p6syVYf7NwqUz44Q81morI6ZSaapQ
         DXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686208; x=1707291008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORw9qKBOGoX07ffDB/zrod7QZpg4hY3LzIc7/zUZ3BY=;
        b=wz1gr4f/56bcjx2AAnlYHmMkhcy8Ns7YdnC2Nw70Xa5FCjvhuspPrM0+uU/bTer90+
         4oOOrvaC2cF7N8wSyObl2VSw+ZFFzZ91VgCJKEFcyHt6J6xZl2BCfjlJcFrr1yRRsbu7
         enEZ4X8mcQ/HJl+GAJf2TsRw4FH2NJL96CUUTQNImovO0TK2PWnglc4C5Prvl0elmRio
         3ez9KBGdk0DjfY1rhecop8l2Hz2+TirGe++60jcYJwPGxodR11qQiyew27VM3t7c/mQg
         ZOJsoZ3VhCb4MlI6xL/X9gxnnjhcl9j1FTdOdyybcbLlf54DAonU9GiGG7YJoiWXACPe
         W7gg==
X-Gm-Message-State: AOJu0YwdkoEg8rqrJY4ZpPVkrtd3AUazTA5pCnypbWPDwAPPOpsAJ0Et
	+uwspuZgO6gx95mxfSW8E12Zgiu8SIlrSgoidTCY8yPyvZd83nDkrzg0ImF9Z5RtZXeLRZjG0y3
	D9wWBXLezwNTsd+/8WaLKtHYOCMih6MxWzpgtiw==
X-Google-Smtp-Source: AGHT+IFtsCGxGjwc+pO+41f7Ymi8oMeEpQ0HZpiVXxfS9R1UPLsocETR6IaEpcdUltRaRm08pzrGqPV88xO7YEaZSfQ=
X-Received: by 2002:a05:6902:1009:b0:dc2:399b:6451 with SMTP id
 w9-20020a056902100900b00dc2399b6451mr908964ybt.62.1706686208675; Tue, 30 Jan
 2024 23:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131115838.4af8131c@canb.auug.org.au>
In-Reply-To: <20240131115838.4af8131c@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 31 Jan 2024 08:29:57 +0100
Message-ID: <CACMJSetH-v-NLD+p3D4adqAkFo3UwEpWczX4dysR288KzZv0CQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the jc_docs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 01:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   Documentation/userspace-api/index.rst
>
> between commit:
>
>   8722435d325b ("docs: rework the userspace-api top page")
>
> from the jc_docs tree and commit:
>
>   32a0a0da530e ("Documentation: gpio: add chardev userspace API documentation")
>
> from the gpio-brgl tree.
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
> diff --cc Documentation/userspace-api/index.rst
> index 67d663cf2ff2,ee58d92c53c7..000000000000
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@@ -30,18 -16,14 +30,19 @@@ Security-related interface
>      no_new_privs
>      seccomp_filter
>      landlock
>  -   unshare
>  +   lsm
>      spec_ctrl
>  +   tee
>  +
>  +Devices and I/O
>  +===============
>  +
>  +.. toctree::
>  +   :maxdepth: 1
>  +
>      accelerators/ocxl
>      dma-buf-alloc-exchange
>  -   ebpf/index
>  -   ELF
> +    gpio/index
>  -   ioctl/index
>      iommu
>      iommufd
>      media/index

Looks good, thanks!

Bart


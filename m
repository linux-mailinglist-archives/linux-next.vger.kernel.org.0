Return-Path: <linux-next+bounces-4412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDAE9ADCB7
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 08:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA7BB21189
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD86418732C;
	Thu, 24 Oct 2024 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baclAgiq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6C170822
	for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752985; cv=none; b=Rwr9vfe3775v1xBA9YeDk3o62tu1Pk8WN14QUECDPYgkTtRAy+/N/NSygW1CARQ9u0iFB511w71LoBpPvyj/fqPUf/tKm4M+zbwSeCS170ExfdDgJeptCaA/3i3rH++ZqDo6AB4P9/KFrU5Pp8KxKlSjhVjB5eDqRuFvkefLD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752985; c=relaxed/simple;
	bh=giGhBl2b6gyNi6ymxCNbtdGEd9cwHBCa/BXOgyqB0fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9E0UZFU70iJ971WgesYYS+Ucfe+jAnOA441zUweuN/yw3+WN+VFCAW4P9341DFMTvSCn2uDBMQS2iQ5TbrjzJFwsoWGFdpo7+MQ6NoOxlPCZQFMMak5WsspBjtg5iBVMaU+D40TW9+tD1kAwC/q3W/k0Tdv8dE1WY3xmfNeJUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baclAgiq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e33c65d104so5065037b3.3
        for <linux-next@vger.kernel.org>; Wed, 23 Oct 2024 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729752983; x=1730357783; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kexszmN5UTJTnSR8yO6jt/Q1XL6w2ws1UD8hREJ1tc4=;
        b=baclAgiqC5BdKrYT4DlVXs/6SULX4MVefE7LAOr1BGeHhUgesJypEdOAfX+Imr7J82
         nFxbO6e0O48FT+u860Ndr12PtdAtHdvdNaHrvUXo4u681DJUwTYzU71vsy08T5qKQa+y
         u9ECxxDPLHP4EzBqWC7W/e4dwEpEyhmq3ti2cuK8yixcLcvAhdiC6IJDkb53FMaP095w
         ZiDoDX7Sgznle+oqEawMPFj81tWnUrF3/mM+HcuAHwQ/bKk8NlVdiWAOtxWrIrd8AtO/
         tBbdKjvrN3sIk3gRGsp3FHGyfyOBMEq3LbVZIxQCwibI4Lqt7LBf6+8tU52iUMO/qBPI
         n6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752983; x=1730357783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kexszmN5UTJTnSR8yO6jt/Q1XL6w2ws1UD8hREJ1tc4=;
        b=uhdKulJQJmZ18Cw0ubXbuqiBdbDzt6OHJMGGzEp+HH3Onn8YnsUzM4agASrs+rpOGe
         7/Co9PUt9jwXAWVA/Dj+dTCE0lnCXB9t0QuD3f6j2roVjVmPqJPz1Z29td8g5UqPiOZy
         48aKTqGc2eiPZ/Ethye66CurxlBlGnul77KYVh3W7SQzTFAeGm9JhQce+rHk+SxUz+1G
         2pnxESYfrDkwgzK7TP/tB+w8ShfqS9eNStKys1w5DgIG4mL7TbvwL8dQ772XOYdE9f3P
         uHguYWVdNRWKJ/NV95iLYsCpLWQUO6MyPSG6CkqlGbx8vPhoM8hT7F0qZDoWICi9BuPj
         qqGg==
X-Forwarded-Encrypted: i=1; AJvYcCU+S0N//QRfQ9PPHSBz/WVfLhs+ufNIhYYFQDsF4WacNZcZ350eUVCMDu5Hdou1cD4dmg2xzEz07qIi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pEZTwQhpUIDFcT+7ANmCH+08mmjSBkCqQ3Jb1VvAGVrTXM7I
	ly/fEy7XSbh9zsEjLjbEZlsH39I8G4C11Dq0D0MUVrQOVGL7hrV74H1mHWGr3S2YkJY+yrthO7i
	8ezI8AJtwAq8foVYmlcywDEkxQ8Ru8pj/5Zl7Lw==
X-Google-Smtp-Source: AGHT+IHz1WglarhaMWXYQ1JktQGU+6kyuOStEIXujRl8NacIR5YeeSmhB6UrXl8FhsDBvUhrTzkKtUB/VoV7xadxGrU=
X-Received: by 2002:a05:690c:94:b0:6dd:b920:6e61 with SMTP id
 00721157ae682-6e8663453fdmr9095757b3.40.1729752982837; Wed, 23 Oct 2024
 23:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024112516.18b226af@canb.auug.org.au>
In-Reply-To: <20241024112516.18b226af@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 24 Oct 2024 08:56:11 +0200
Message-ID: <CACMJSesMpF9v76Geob83ONLUQUh7DXRYbPV+JOGNkCN=Fd-phw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2024 at 02:25, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pci tree got a conflict in:
>
>   drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
>
> between commit:
>
>   ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on pre-pwrseq device-trees")
>
> from the pci-current tree and commit:
>
>   98cb476c98e9 ("PCI/pwrctl: Use generic device_get_match_data() instead of OF version")
>

This can be dropped from pci-current given that the former will get
upstream into v6.12.

Bart

> from the pci tree.
>
> I fixed it up (the former commit includes the changes from the latter)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell


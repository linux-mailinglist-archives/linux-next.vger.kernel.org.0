Return-Path: <linux-next+bounces-7429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEAAFE59A
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 12:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF98481B3F
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 10:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B3228C849;
	Wed,  9 Jul 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5ft0tOO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DC289810;
	Wed,  9 Jul 2025 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056598; cv=none; b=e7e2Pwpv5EHSpjVzeYOwQ+8g/t6yVv0ITd2JxnopmUuxb9+Vgx0Qs1pnB/J8ukMN259suJd+v7Zydxk9LxDQc8GBDZGIjfoKgE6m3siYtXkoARON/f5JbkpJ0YtIdEgn4EPGXS8mLMMk1Hpuu+bmi9UyFLYTuyN6UXKoi6tY8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056598; c=relaxed/simple;
	bh=m86klt3bUXzogxZ6eFXZ3X4S4JSQQ9rVLFkqhYarAm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+HNcvbcTo2+xHf4ti/qV7BCt9b7TAcy4ECJ6165PhlYys012yNPutCyGqrqJS0O2RWUwo0XVPWPnRHyRWdoS+thHiqzDaWAmDk1/Cb72ARvbraXNiaY5bzNEu60zkLYvE8fJiXnco2pX1GIjYBYDTndja8bCKybQ34CvrjaZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5ft0tOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD1CC4CEF4;
	Wed,  9 Jul 2025 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752056596;
	bh=m86klt3bUXzogxZ6eFXZ3X4S4JSQQ9rVLFkqhYarAm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c5ft0tOOLRtcwzbgnTtdCuFo137dBDhW2e8qFQf7m04ApNkjTh1hOdjw8E7GAW0cT
	 Dhl7vWR/IR6wIMtMZN+L5Lo7zwoBWe3QBoTfgPyQzigHvu6w8JXPh2t+9wSDQJbEG9
	 aHaU98gvve020wHJN8IJGqWIkyiSyaRCfnHWU145vn4+gj6IgB6Ota21nA+/QesumK
	 n/WQpDlVcJy9KxtLtAmSaWM58nc5YEv+75p7U4BJcPp14oEFgw76vnNF8dMrZ4ihAY
	 1rDLKki2o7AYkWh77IDj9da+oBz30cIXjPKbEbcFcs7RdIpJ7TjumJAjRxEIkvYaY0
	 JKJo6MYE10+7A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-555024588b1so5308778e87.1;
        Wed, 09 Jul 2025 03:23:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoSLsrQRFuWtd0koHL0XWdsxC1Rew7BKbLw6Z0k1PU5AKSmiZcY7Pab3Z1FsiyxYXTJDDa/l4gdI+WXw==@vger.kernel.org, AJvYcCX+UScxCPzf4hOA1V9r5qDILuf7ARz6qGj8hbamSShuz+2JCBzroaepf2mdHHbGLOoA8of8XhgMiq6bFFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVL+2CyWbQqIToeYkDUY0JK1uqe24joZAtasQLI55GTKNfaB9K
	l6qlcR1M6waTRCi5TeD8HqvrKyipwnnyOlhcZjYoi8bc4TrldY70/d3bJ2EtAaLxDZmkaqyJjtz
	sXY7YCGcNLlv5gJ9WseVZrH2yGUE9iwA=
X-Google-Smtp-Source: AGHT+IHNNaG0A6nD9i3CnBYDisREyxVutwaDMEoYjuprFSlq+wkcOEKPSF/RdTk4+XmRjhkPZ2BqDbQzitDI7ebPPgM=
X-Received: by 2002:a05:6512:2215:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-558fa87c9a0mr752287e87.9.1752056594890; Wed, 09 Jul 2025
 03:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709202107.6d570574@canb.auug.org.au>
In-Reply-To: <20250709202107.6d570574@canb.auug.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Jul 2025 20:23:03 +1000
X-Gmail-Original-Message-ID: <CAMj1kXFVBthh8Umx0WOEX_N-Yy6yYHtLKWV_H9dw6BU_JgWcrg@mail.gmail.com>
X-Gm-Features: Ac12FXyiLEh9FYqjHRXAP8R9XPj8wyoWoOqDRCNmP4PpVlMCjbUs9qaHIZoECVg
Message-ID: <CAMj1kXFVBthh8Umx0WOEX_N-Yy6yYHtLKWV_H9dw6BU_JgWcrg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the efi tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gerd Hoffmann <kraxel@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 20:21, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the efi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> ERROR: modpost: "efi_kobj" [drivers/firmware/efi/ovmf-debug-log.ko] undefined!
>
> Caused by commit
>
>   42c68c6e354f ("efi: add ovmf debug log driver")
>
> I have used the efi tree from next-20250708 for today.
>


Thanks. I already dropped it from the EFI tree once I had received the
same report, and an updated version of the patch should be
forthcoming.


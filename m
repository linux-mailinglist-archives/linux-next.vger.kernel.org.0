Return-Path: <linux-next+bounces-9047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AAC64738
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 14:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 974F84E77F2
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 13:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113DC30CD94;
	Mon, 17 Nov 2025 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N40NLA5e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1632A3CF
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386931; cv=none; b=lpWs1lWksDw2AX6xz64Exyr7pVwmuxhrA/WPG5tRBVzn/L80DPEaSjUFAVjcSDqt+8zL7l61myTAg/zpQHZGCENz+9CFjGx7bX4xdSoNQhfZFl9Iqf4bTl3oJmEisIWUgFGumsfd72D7zOFkVhJx8zB193S/u7xrjT7O9xCBQkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386931; c=relaxed/simple;
	bh=dEHpJL8Bt6p0Cluiws+ZceU33Xy6JCjmyZV1RLG5k/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUp4hTf9CDYp8S5ASkvw4yOdCF1lM7/bO5rs/oab2x86AAwU1nD3nv61TvuAsbyTxkoOTReJujc4jIVlRfPKXJmJUTpY7s0XxFsVytseNJqleM7bT75QeJ+LigEvR8saDdtHBijQE6TLhYv5I7z9579GTX+0FAy3JBgJcA2bbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N40NLA5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0F2C19425
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763386930;
	bh=dEHpJL8Bt6p0Cluiws+ZceU33Xy6JCjmyZV1RLG5k/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N40NLA5ezoNY40ujKwOtkTFj+gZ+SVIAaKdoEWYzU2t5J0FEbZ3t884bVQlXV8A7v
	 2FQ1b77IYYvcmFELL0TR1PKGfGIpCsFkH+JIi/55Nfu9q6zU52Ksrx76+X4uQxD9hg
	 xcx1L07sYC/v3Z4gqvp17gceeJBQ6MjX6hSf5OrFj2yFRo+FzjAIUkipEZUPmg0dHB
	 ddmkZ8xxKLcC5w1EpT5/QcWeX1KiSSHq30aKSo/WbwhOJsY4OZKnt4dBfg70t9KmUz
	 ZuY0yLMpqkn10S5ou6PWI48M3OwEr0Hei8gaKi0s5keJmJ350i8MnEs51m2DF6iO6I
	 as2ax+YBcadwA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b72bf7e703fso718145066b.2
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 05:42:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsOgKwuqMu0O8dLl4R0/mutwE6RbS2NmyKX3GgTZJ4j/t4KuIRBirB+/FFIruqtYd5X6FrtNlGs3T5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Lw1dfFwsKmoQXBWsIZMVx8ODDGZAoK3rAYzQs8FfF5bZT8SH
	BjbnlCwhvS8ztta4p6sGkv/PG6TXFKv14bPEVD5y757pdT4vU9+2jUZOPET90nSEjmItGI4PIgn
	KAEmp91fGvLLBwKJbg6AJUELgghKtHw==
X-Google-Smtp-Source: AGHT+IFE9FVFBwHLIFI/nCxQqXq3UJp3WwVkt1asf5bbyd3paX50D3tGAsX6bqo63QBfp8RhMjA3/GQUyjXNHyQM9sU=
X-Received: by 2002:a17:907:9341:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7367b9d3bdmr1248446666b.50.1763386928970; Mon, 17 Nov 2025
 05:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117143744.2dbd6be5@canb.auug.org.au>
In-Reply-To: <20251117143744.2dbd6be5@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Nov 2025 07:41:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Eh4_4npMEf55wwd6yoqwf+Owj5RvMWRAnrWF50gudSw@mail.gmail.com>
X-Gm-Features: AWmQ_bn8SOTtXzE0iPSVUEWofunoVAacpS2XnsIZENY4zavRTBWGfI9QEY47HpI
Message-ID: <CAL_Jsq+Eh4_4npMEf55wwd6yoqwf+Owj5RvMWRAnrWF50gudSw@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 9:37=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commits are also in the watchdog tree as different commits
> (but the same patches):
>
>   ed15cb1d21fd ("dt-bindings: watchdog: Convert marvell,orion-wdt to DT s=
chema")
>   5415ea2a70b4 ("dt-bindings: watchdog: Convert TI OMAP to DT schema")

I've dropped them now.

>
> These are commits
>
>   fbd10d967045 ("dt-bindings: watchdog: Convert marvell,orion-wdt to DT s=
chema")
>   af34a25336ed ("dt-bindings: watchdog: Convert TI OMAP to DT schema")
>
> in the watchdog tree.
>
> --
> Cheers,
> Stephen Rothwell


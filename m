Return-Path: <linux-next+bounces-6163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC5A7CF76
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 20:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E41247A422A
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 18:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF1C199FA4;
	Sun,  6 Apr 2025 18:21:46 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1D1CA81;
	Sun,  6 Apr 2025 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743963706; cv=none; b=pfgOdnlZd+oGhl5hqy8gpy9/iUB+ANwslUDI+qSVYzFsWNUzadDrnsqOU68GsEehpThuEhXRqkWqcPsYao089uOMOvikEkv0kEmzgkRTVZ4hQmdHC8kd9AhkQjn4172SDvbYhQCOgvudJqDtLt4KX+H2E8lkkPa457P9ts5R/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743963706; c=relaxed/simple;
	bh=LaZfxkSb5FyHIDc0qBbJvYi6Ow3SxwYSODg56DGNs/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFIAXMvjq1uc0TnbpEAI62mPwDUSBWsbDoOtK1beap9P2lgWLGpyl0Tq6MnzdD1LtAxP6L8enFBs5ZWW9y0dmGe1x66Xpy2Rf36aQATfYLn+Ji9wKu3H1YDS1jiitLsbENJ1+DVqwDm/TL+I9CZmjhCh485S7FbWX+X0TO3HtEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so1619835e0c.3;
        Sun, 06 Apr 2025 11:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743963700; x=1744568500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68f5FHAmZta1ghAPpoGBWcTGk+bj6/niB8/w0no43ik=;
        b=bwcyCTP3sKHfJYh93EcMnBfX6DQj1heEdGKGeSyY78SMQEqGGifk6t6kUr+8fTov5A
         DUGXYTum4uB/ePwecJdVpaQ5jUqDp/R3UJDcNFG93Tc2rE/N08INeCeL2LzV5FX8jx+v
         5nJgjDQuWrP9wEzrYoOC2RS7+uyFwipI4fHUQUmsVzCRyZE1b6NeJiiGff8XLADHPi1v
         soOzaDVx4/gGIZAc8hDlbzWfi0tqepgCdkV/iWMKrl5Ny/HVEE/n9k2Kxb7HjKq1v2fe
         SQk8n+TBbl7S6ov/Gt8ssIW4fj6jVe83RKCtFKtoEq7pVfrExDiE12qxIQ2vC9CuBSO4
         4+/w==
X-Forwarded-Encrypted: i=1; AJvYcCUl2nreSFpYvFVcag+qsGOCBtXMmQiIgq87lD2C0GB5+sOXLnedNERowV2LigWVQrdRuNctlvzds2mSk+Y=@vger.kernel.org, AJvYcCX/jE9gOp3mmLNfXW3nIJYNRpa4u0Zp+aaJfc5TJoUAI9fLD5sgv03uWimRXZFLv4YND/HlQR6U5FXUkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6y8IzxEAazKD52X+Jck/UImqwAScgXGCI12WMZ/icpNP1qB0
	QrIWCvjMl6yZ7dvyRxDYLgY4gA8UuWi8fWyjON1ALOEWxXLhMtJZjzUWeKJ5
X-Gm-Gg: ASbGncscaE9sQiJJJEZbNI1lgmaCwg7FaCurcVWFzdPSEiVzk9iyNMtEuD83hIj5nSv
	lzChXfGk4q/ITaTj7F0NWm9NxtV6kDiJwt3cvB9PatOE2Eep6eZr+Hqd5zdLqpnd/rL+ae35CMx
	SV4QDiWkwVd5Eu8dFgjGOrXrX2LhJyCACAPg6CkGv6H12WIAbfk8pRjI8g/pYNnYogImiRgoRHs
	2cpKUDqV69kfcZQyFCf0AIAjq2uVOeXGpVNno8cfvrEt4WXJFU4qbSHOQvFa3zzptesXtuKdZIt
	3EQGFrdbuOGs2RyuoBeKXm2AQT+VR4Yc6mkC3/KuuJRX9mLKD7cdN570QJ+n24lUeVhMYLksQi+
	jcDJhWM4=
X-Google-Smtp-Source: AGHT+IEGMn1pA1cYGHfXOyh1Rv4Go1MzRnm0Tp01LMUfGqfn8A1AvnWKfI8TNdqS3MmXOdAaPqpbQg==
X-Received: by 2002:a05:6122:6593:b0:516:230b:eec with SMTP id 71dfb90a1353d-52765c89280mr6513732e0c.5.1743963700058;
        Sun, 06 Apr 2025 11:21:40 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275ae64302sm1575418e0c.24.2025.04.06.11.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 11:21:39 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1713291241.2;
        Sun, 06 Apr 2025 11:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLx19QPiWTie+UOV5HTLJgB2eYVAZ0tcd+sWNlbBb/+PlVBVBe6hDHBCZ8FifkbawbMpaHLy8DamfCyo4=@vger.kernel.org, AJvYcCXaBPsUzN/VC1NcFhHl/3xKXVsD6XoY0RtMbCA/QvEjfDKeTRuPZGzapB53zT+ZcOdC9pxbGBMS1Dc1RQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f8f:b0:4c1:7ece:88d9 with SMTP id
 ada2fe7eead31-4c856a2c5b1mr7651241137.21.1743963699239; Sun, 06 Apr 2025
 11:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324173242.1501003-1-arnd@kernel.org> <20250324173242.1501003-2-arnd@kernel.org>
In-Reply-To: <20250324173242.1501003-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Apr 2025 20:21:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpbrLms_0Ukfdz2Me_VJxP48X1YgSCt9hEc=T2AZWjtg@mail.gmail.com>
X-Gm-Features: ATxdqUHj902URW2CruvbnJIkEHk8_NegI2tcXrNlPqQrXtXbUGHKxRBOcRDA6dY
Message-ID: <CAMuHMdWpbrLms_0Ukfdz2Me_VJxP48X1YgSCt9hEc=T2AZWjtg@mail.gmail.com>
Subject: Re: [PATCH 02/10] ASN.1: add module description
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 24 Mar 2025 at 18:35, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is needed to avoid a build warning:
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank, this fixes build issues in the m68k defconfigs
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/lib/asn1_decoder.c
> +++ b/lib/asn1_decoder.c
> @@ -518,4 +518,5 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
>  }
>  EXPORT_SYMBOL_GPL(asn1_ber_decoder);
>
> +MODULE_DESCRIPTION("Decoder for ASN.1 BER/DER/CER encoded bytestream");
>  MODULE_LICENSE("GPL");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


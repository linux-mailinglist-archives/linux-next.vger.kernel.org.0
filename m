Return-Path: <linux-next+bounces-5761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF887A5D577
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 06:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75C6189AD17
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 05:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C5E1DE2BD;
	Wed, 12 Mar 2025 05:20:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CB1DB546;
	Wed, 12 Mar 2025 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741756835; cv=none; b=BEpgoIePj5veloCpgEFi3h0sizYt0xioCLT1gXH2pL2Wr4otYoJ8gz+CLlR1ZMHd4I9ASOw7jG54UDK047KyFo5+1pcaYsMGdodn0ULOYAxHRq8eo1c4XwejpwDOnEHmCCeEDHfcIY/tf2XOyshEdMRrEWpF0rn4RfUEoqWQlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741756835; c=relaxed/simple;
	bh=0RD6gH9Lv2P9oq2nmKtG/bmzdj0u7M/C3FoVgNguHpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRwRTrZjwxZBL9cJSSt4oqqqB40qOF/TxHui9B+Xi+HweMzu/mV/DH82GTJ/8xievpifTacKLIcKa5kLO7kMMxsO5tSVKci55HwBC5TXMIrjrO0wf2NKGQAr+pi9AtGokJmZJTc/bkkPM1t0xCEYmubidYxPimoagfHUuCkIh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf1d48843so52821631fa.2;
        Tue, 11 Mar 2025 22:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741756830; x=1742361630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CBACq7pupfTR3y0YA4S4UUPtz5mEsdij9kTTqAVipQ=;
        b=ZWd2rXN5U8Tg0FU6hBKlTYo43+cC6jF3LyVNvgPNowsLSeKpCJvu9yyiuuIV9b+HLu
         Mv56TGwbHwFIsV5xrA/w05Kb0kH9+swmFckwgfcn5xveBhcj3g2vk50JQ9IwAseLY3ps
         v13ftmx4Xv0SFw+XcXOx5OWQPeXPixtJBb/5CcB5hfuB3vvRfBNNjeIxatOFrU4M50r3
         AAqqbWYzB+pI/p+q/lQVEUcyPkYmo+czjmiUMAkBlFhtB8qx3YvkQkNsPdAXwLpuT3ZY
         gtrSVXMGoW1Bgi6cwguZxaoZK0eDtesbCJCYjioz9qLfecz4Q0fyx0GdQyb/2+19BQU3
         y/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUmUfhgOZ+u9oEwhfS8spQSZZBbMQjq10Mrlrgszh/sI/SDyXoTIX1CZKFcll4q8fhm00HI6aDgqGo3Xug=@vger.kernel.org, AJvYcCVDWY5TcRucKBYTm/gQvwzNJPkkoSUU0DJQmcl50SavYApU5FEcg2IymE4Cf36xws8f96wmGw1Xm0+iHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXXEjtkOobwqfh4n5liyFGkq+0WkOxLtavFIRrfCypQKOpACc
	0E/ZYbIKI7aZb0je86EopggfhspR9l68HLisoKF62S4vBSMVwjnQzd5DHySS/xw=
X-Gm-Gg: ASbGncti/w3Jkw7PNnFoOSjqSE+iB0E5BLzbThkg6iHD5vF/8cL4HSXbVBezUL7sUki
	lxlNjJXp+h1ShUwmkcc3bdjV8eXjeVovjE33/IEqUdtCy1TNET+oLgHsa9xcbyYFS9ElbQX1IKL
	JkfaJK769uWh35lPgDzRIpEQ5vQg1sOhzYfzPoiFH3veBUhnnWkwq49tUzMayVF3PWPDNTnbAJl
	7yxv7JlV456m5dZxGvH+rglBAAXjBkZ1vPTpqKSicp1aHISyz8fcNInPBEpZn7FlCSDZO9btQPx
	yurFV7SPRPHPa66nOReHfiTR4/W4PdtJxts182uviQMwJWKOhlR++JqHmrhzFsqXAGiQ07mhyEN
	chA==
X-Google-Smtp-Source: AGHT+IHpCZP/WjNyaut9R2gUdNQzRM4xfRXCsxSkv//24TyqrDGyqp3IzN4edW/MdM6BmY1/Kfe2aQ==
X-Received: by 2002:a05:6512:3ca0:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-549910cbf59mr7023801e87.48.1741756829771;
        Tue, 11 Mar 2025 22:20:29 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58079sm2002012e87.68.2025.03.11.22.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 22:20:27 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf8632052so48464311fa.0;
        Tue, 11 Mar 2025 22:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYQDZ2DgytjmH5bFlgLYoAvlGR/4aeJOyXC9So3M1T9WdaJC9vDEq5LxG3gmGn4bVuOIBpDVho/R74+w==@vger.kernel.org, AJvYcCX8F0Ut/wxjEVDp8l5yq2yXs8wTTXN+8cdlXFMD3d6Jgo5qebF1+OOBVBDbQe8Los2Z/9eiKUwBTIYPkic=@vger.kernel.org
X-Received: by 2002:a2e:a78a:0:b0:30c:160b:c766 with SMTP id
 38308e7fff4ca-30c160bd6b9mr33439021fa.14.1741756827524; Tue, 11 Mar 2025
 22:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312082439.098124ee@canb.auug.org.au>
In-Reply-To: <20250312082439.098124ee@canb.auug.org.au>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 12 Mar 2025 13:20:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v679nTazoZP8B4OL2ECfbGgfvc32wX-J3CNMgCOj5HFPGg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6bdeuhVByVrSeDNB55NlgeKvj1SgnufsGBOVGRQxm2spFN6BuEZrBSpM
Message-ID: <CAGb2v679nTazoZP8B4OL2ECfbGgfvc32wX-J3CNMgCOj5HFPGg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 5:31=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commits
>
>   575464821eb0 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
>   9c8d960c13ab ("clk: sunxi-ng: a523: add reset lines")
>   4548c0414839 ("clk: sunxi-ng: a523: add bus clock gates")
>   680f52d723e2 ("clk: sunxi-ng: a523: remaining mod clocks")
>   5fd7421770fb ("clk: sunxi-ng: a523: add USB mod clocks")
>   dd19c52e686e ("clk: sunxi-ng: a523: add interface mod clocks")
>   9bc061e57b4d ("clk: sunxi-ng: a523: add system mod clocks")
>   4b759de121c4 ("clk: sunxi-ng: a523: add video mod clocks")
>   2d47dae93981 ("clk: sunxi-ng: a523: Add support for bus clocks")
>   04f6ff49525a ("clk: sunxi-ng: Add support for the A523/T527 CCU PLLs")
>   38ea575784d3 ("clk: sunxi-ng: Add support for update bit")
>   24ad1a7e8a3e ("clk: sunxi-ng: mp: provide wrappers for setting feature =
flags")
>   af7a221c1213 ("clk: sunxi-ng: mp: introduce dual-divider clock")
>   17bed1817f11 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 =
CCUs")
>
> are missing a Signed-off-by from their committers.

Thanks for the heads up. I used the wrong command when applying them.
All fixed now.

ChenYu


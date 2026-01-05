Return-Path: <linux-next+bounces-9542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2071CF2E8A
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 11:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98E6C301CEBD
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE2E2EC09D;
	Mon,  5 Jan 2026 10:04:54 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FE2749D9
	for <linux-next@vger.kernel.org>; Mon,  5 Jan 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607494; cv=none; b=EAc6NutaqlAiX8rwfv3gvAw/nJ4d5RtOBvVRu6usrHUXVOot0O3AQYpHafGCcOQz+lHUIU/1OX//8iv7pLCU9rMKDVAtHr3pQ/9CIVLP/1UplvDa6UP4bQA6O9nDRgLVPDB+hdl+vBv6fcSGCWUGeHNo8HU0Pzg89Z2911Uy5ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607494; c=relaxed/simple;
	bh=h2D8NgM6vupskFuc6uQe+5pn56KbOmJjWVi2paQ/29c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjbkIZl2xrzrmO25ZMlrxyF5NaKuGz4IJ5rpk73oG2iFD0FhXww249PCh1dGnqBJ1Oui7CEO0DZv/iQcRfsEG+S58XQh9QbWLKAofNIcFkTXf7wOoERW49p44TEI043Oml3q3NZ2HOWycygRIhXVIHKsPTUmaZtYK1Juiws35Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5e19e72c2a7so2831120137.3
        for <linux-next@vger.kernel.org>; Mon, 05 Jan 2026 02:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607491; x=1768212291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BAOQcdbZfHZNCL22UxCDiey6SSzvVw32cZ3lQ7se9k=;
        b=bRsDmfLU0gmqYTznGSrCqRjewd2FmrD7IxK2PSvxGvpmLbqHVVNEkaZo4BiU0RfkEf
         wJvT30/C8pWwG7dZ6zq7SdfumNfXc07t43PBKXCMbSRUuXz5KzEc+ur8SdiUBk65ahkm
         ftXClnBdbWJ9SHRobXUBVaj5/RSrOTOcyykq8pM1Mw3wKn29YlbZWKFs9+wKDw5LmLHd
         qsHHdxXgA484g50SVt7Pvf76m7H6wvWnbtBK7+ZkO+0hAMM4EyjAfeJNQhRNOdjmqTPQ
         P6fsXXYX0xaWkoME8bc5QoW1jdYvXqSmVcuLGXnC4bw+CN2AytMr1/n9wFRWNppJhzSF
         m66g==
X-Forwarded-Encrypted: i=1; AJvYcCXxaEO1FkIxaf4a5YSw4sERqKN0tnycH0qF/VWVmwA2eMDXZkFaGM1bZJLhF+7A28qvRzESLdlcXJJi@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+rtiUBS6TzthPpXtcq5RNljeoV5nML8Fm7Fh4sghlBmH7jdp
	D+JxacnIU002h6pqqclQIkRxaUVxLd/E3CN+6OBxOzxpyWDvx100oBOUQJTMP9Ym
X-Gm-Gg: AY/fxX6PdPo0ZbgF6pKW0GRdSnSoH6QUW1E911JJwZoBSOt4ga9qTP20AAkcxe5uDUq
	fah+vWiDgH+XJPYq6UwcS+G0nToRqw4Bl1bXyN88NkRlUQ7G1dqQ67XfPU5eBbz8STIWh3DItZS
	7Lu/tiHropxexqHEUFSDXuBDQvTeelr7Ci9oyEt7RtPi0b7cXhMASVI01HsU3ycJsDjnB9FyfK2
	vg8YTIR08EaHV1VindZTwvzpT1nCLCyXZBVYrY6DqTfLJXjW/EBoDLtmNiIx72pY0uqFW+JaLt4
	YYl5UBwmdBEpXb65Qh+JgeyDaHYMEdf6zdfWmTigVLeDBHdwy3YCkiIgJOfK2Qvh/XqQ/qrwTwQ
	um23gcUKQ7g5QRTdpxTR/C+om7Gg6ZYJCl6geb5MgVjHlNfRGOO96KunNoCvqUNc0W9UJKuvC6m
	S8v8SgcwQQv3b5oDHLsOok6B1pYF3WmW/CZ2mv8Je6iF88dAlw
X-Google-Smtp-Source: AGHT+IFzRNiKbru299PucQ/G0P1Bv7ijkz+Jx1L/REfbOT7ucYQK1t1QFCdka4i+/RS08+TN7hF2pg==
X-Received: by 2002:a05:6102:e12:b0:5db:417d:923d with SMTP id ada2fe7eead31-5eb1a7c1375mr12828420137.22.1767607490931;
        Mon, 05 Jan 2026 02:04:50 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1a85ba53sm16022306137.0.2026.01.05.02.04.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 02:04:50 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dde4444e0cso4831850137.0
        for <linux-next@vger.kernel.org>; Mon, 05 Jan 2026 02:04:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdPGCq6b+zxHzdOy9f+DYgVlQQ9t1fo1Gf5YHqg298tZEXjJ6CzHOuNoUCgg/8aI9sTtKKYv/5eovE@vger.kernel.org
X-Received: by 2002:a05:6102:e12:b0:5db:417d:923d with SMTP id
 ada2fe7eead31-5eb1a7c1375mr12828415137.22.1767607490429; Mon, 05 Jan 2026
 02:04:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105133854.166d32b8@canb.auug.org.au>
In-Reply-To: <20260105133854.166d32b8@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 11:04:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVcLLs6BzmVTaikqVqtevuT9N2F1W6iBpD=1WTpWNXdw@mail.gmail.com>
X-Gm-Features: AQt7F2pVoTqAdQnr-VTbXTdFBY80gxdnoEfjF0NjjP2py39WFKdhSj3ONylGRcw
Message-ID: <CAMuHMdUVcLLs6BzmVTaikqVqtevuT9N2F1W6iBpD=1WTpWNXdw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the renesas tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Mon, 5 Jan 2026 at 03:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/arm64/boot/dts/renesas/r9a09g077.dtsi
>
> between commit:
>
>   2d8568dddc7b ("arm64: dts: renesas: r9a09g077: Add ICU support")
>
> from the renesas tree and commit:
>
>   9b1138aef9a2 ("arm64: dts: renesas: r9a09g077: Add ICU support")
>
> from the tip tree.
>
> I fixed it up (I arbitrarily used the former version) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,

Your arbitrary choice is the correct one ;-)

In general, please never take DTS patches through a non-soc tree unless
an Acked-by is provided.  In this particular case, the commit in the
tip tree is not only incorrect, but is also a dependency for later
commits, so it has to go through the renesas tree.

The same applies to the corresponding r9a09g087 commits.

Thank you!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


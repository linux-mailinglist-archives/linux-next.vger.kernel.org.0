Return-Path: <linux-next+bounces-8642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCCBEF127
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B076B4EB055
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B131C23A9AC;
	Mon, 20 Oct 2025 02:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7ush6/4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB625C804
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 02:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760926485; cv=none; b=uwI2I1lTdnAZplasbWQ8FZ1/mEb4Fk4ZaSf3vh6hEQyR6eGEGEYOK9p7vaqjtgZFklJ9M+y6Io6s1KZ2nd1tAeOkkVAlbW8fAs943EA5EI1KO3qIrTrb/U61m1ywU4ajY3nRM8Pm/Kdz531ELs1KtbYt1e+ZVXpzCJ80A/yqSTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760926485; c=relaxed/simple;
	bh=8JfHOylAVVip2muOOt7ETieAPZo3QGzhMvbAFmkzR1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=foA8AE4qrhlH5pUQu8Zag6wp19mQ2KMid3vIy0oV2Rnza29xAcbrrcNOK9VdfiYPvJ6KDv/QNc6Pn2OvLQfpDyZCoEe7qbWZClfMnGkKzga5AMOkEz46j4wulD88SrcXqn0KEjhsguNdp0MI6V3kVY9XypJGCL+qljjaC4zT2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7ush6/4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2699ef1b4e3so6754765ad.0
        for <linux-next@vger.kernel.org>; Sun, 19 Oct 2025 19:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760926483; x=1761531283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVsG9Um499m4I5IEf6ueuZxgpEkoYUIuj1YcdEGnVKM=;
        b=B7ush6/4VZrKLHd5nScH8fKvA1ckixpBGBGUC+7rzSyQcFsANpgsCzSfXiixA8KPXj
         jXcv7DqIIJl04nWiwpUM5mw5E16DYTbaULepwzTvTLcSugerU7sJhNU9rZn9lxAATGqo
         pINUKXEywI3/A5v93uhswwAxVCUJ3ykQL1EkGh//ur8rCYNwxuqcInvHd8x2v464dWKd
         MM/zEBmgKiUx5DzJG3+2ESN2pJ4yx29yDj9xX1Wwzg5p1SSAhOGAdgYwIpl8uE79soiN
         51wo3yYZQf4GYtrNga5Bq+jiNXUJbjONKPRwVJ0wclhz6gDgHR9O6vxa9dxdS+Q5kbOW
         +E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760926483; x=1761531283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVsG9Um499m4I5IEf6ueuZxgpEkoYUIuj1YcdEGnVKM=;
        b=Lxokmz8RJVBXs/h0LDZ+5uTfULzEBCx9JX6F5h7bweIL0oi9v7Q+b4v6tsmiepnJQ0
         huQhr8D40Y/FvNn0Qz8zGZV8FHZ14yVJGbW3DkcLkbfhOHUUm+Aa7CfjRslqYzB+PHj4
         m133Fy27l1waVLgDTygsoIKohhxSwsDbWGQ/QtgAhbZXY8D4h20bBkktUA/TPmxSdzf2
         +dn8c0GvqBEgFr7/z02eZdm2oARApRsQWw5WYNXZpr2pen4MYzoqpgDORXqp6lo1kZ2L
         IUM10sfcnIDI/qcF9kcfc46R1RqdQgjT4n5DYviwdOS/wFcRAin/VqreqZw024Q/Y6bu
         LvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaxDYlKdewbueUep/5Ayg0ogO2p3kUB880byM7h+5Doz/2h7FjADBVBKxkU5ghPfDEdbvA8OXR1crQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAEL8yGdeK657tNpop9g1Qbu+qV28tF/JwumjorTaMjOS/6/c
	OUeRoGhgiLAFhf5Cn2iEYIi7vuiOxg1VD3Fipslu9MWaBRONdhDc3H6+siMzKhW4GeuLvmDcH4l
	cKFGTVongrW1n1P9onpDKu85hw9EvbSo=
X-Gm-Gg: ASbGncsIDl02+RqM21XxUa1yX0zbVsf66gReWhNED0kG4K2qEDRr7F/Jh6MQBitbTwZ
	y0sBT9jQkvq0iCvfwpA2hKbsQwCHLZmakH/6qNZcdJBnG7Dqb+epi/SDXKfBY7LvYCbsGPJE03G
	sBHleQBrcK9rOuSammidptLLvXeqThyMCmdcUpkh5vliPK/uXpaUAGm7gEfVlQOkckTUKdvL50S
	OJWr7ycWZsZmJ3QS63jWW927e8PvTTcNPhJXLbWer0Nvco2yGkm1suN//Hg9dH/hjj9qsmlKVxa
	GIYsS5yn0JolyWzUdioKbA8NjeIV2B8Gt3kv+LhETsr5MY9ihbhsOA1agNE+eN8x68U2bN9dEGg
	N+yiS76xSGHWTvA==
X-Google-Smtp-Source: AGHT+IFoTDHFumvg+2Yk2emYmQtucNR9NpaL+I7bbTkx8Mw5vZ+9U/yijmuyuLh6n8oOi9ctCSyePVKDkAY+eLSipNY=
X-Received: by 2002:a17:903:1965:b0:292:64ec:8f4d with SMTP id
 d9443c01a7336-29264ec9324mr31315655ad.8.1760926483145; Sun, 19 Oct 2025
 19:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020123907.13e15922@canb.auug.org.au>
In-Reply-To: <20251020123907.13e15922@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 04:14:31 +0200
X-Gm-Features: AS18NWA3ZmGHFmBFe3-4nb8TG3BuQ8EUt4EFZAl0oM-rY9K-dBB0ncgrANro-v0
Message-ID: <CANiq72kHWgsvmxPYSAHpM5HaxCSf73t4NkPsBRXiPMTTe_u51w@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 3:39=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> The following commit is also in the char-misc.curent tree as a different
> commit (but the same patch):
>
>   abae8f3c8374 ("[TEMPORARY] rust_binder: clean `clippy::mem_replace_with=
_default` warning")
>
> This is commit
>
>   7e69a24b6b35 ("rust_binder: clean `clippy::mem_replace_with_default` wa=
rning")
>
> in the char-misc.current tree.

Yeah, I added it at the top to be able to have the `rust-next`
Clippy-clean, but I don't plan to submit it.

Since you detect them, I will remove it to avoid confusion.

Greg: it would be nice to get that one submitted to Linus during the
-rcs, rather than the next merge window.

Thanks!

Cheers,
Miguel


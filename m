Return-Path: <linux-next+bounces-8807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDAC2E800
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 01:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD86189B068
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 00:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE493019A7;
	Tue,  4 Nov 2025 00:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd1daP3U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5252FF67E
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762214404; cv=none; b=Jc3dcCtf5l95kLF9Pn7UJ/w7S/PrPenPZo9drCVa+cOwuWs2QqwssD9REYQprnoI0k/ATa0ykYF8H8VzMUQlnEROOKkqMwenP9HR6lMyQJriG8y10pJLtV0Dt3xqTJXLgE5lNomTgl8xC+O/tE5UK9KCULoT0k/xvVApbpI2/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762214404; c=relaxed/simple;
	bh=KWPNuUAA+ZhQ/+txjpPIM4bu1Y0YAxVagodXMSfYadM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2NL1tsrzXOJVsnwjMMwvmGkS6/wBStbGZ+mbiSA/2XnKsGGSeAyseosJ4smhNLr0L5d0pfBBbYSqAmiRe7dmTk5YjmiZBGON9zMvfgsPO4avM6aBBj5VSPdBv05ZRWtmi3eehhvghrUozawEpf8N0cJS5vXzXcwKAeZinfg01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd1daP3U; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340ad724ea4so476725a91.0
        for <linux-next@vger.kernel.org>; Mon, 03 Nov 2025 16:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762214402; x=1762819202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4GA6qXjepP74GDLbPqnV/zm1OBuSXWJ1hYuYBFhr4k=;
        b=gd1daP3U3+g4oQu8PR785iIZdfOkVoMU7LIaQVNCOFBoz9Kd3HikBlC3pVL9BkGOUD
         m1j/y4CqWqUxHswW7td6ajnUXHTLjMGI9/j+52fRWAE9qxcBT8TgKTsFtzefYrjvs/lr
         MNL5yOYgX00LstJi+M78t29hiY/z9GnXd7iW5p2t1NV8ic5+G22B9wCtv+hVbfzn20xj
         LNYKUYe9AvazetvQy8oyx9mCK5m9sh1tnWCMZfzDmztHji/vIWuBb+52kkfIkPLqzugR
         I0W8OzOM5Ld7Qrsixa2OUhJVEAUfVJW1EYSknH4/MwD2C1W0xMHf5SPpgWl0Gybp1BPc
         2A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762214402; x=1762819202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4GA6qXjepP74GDLbPqnV/zm1OBuSXWJ1hYuYBFhr4k=;
        b=b8buF5OUKMgwKoK37n6wH/9BJleIbdtgttYJIfJQkP7puMaq7W/LUxZmqT0wl/f8mo
         BXF3dZInOI51TQDC31vSCGigNS84vvdC8URZsU1X//JDWCGKCuv/kHNpa6fzHd8WLt5B
         bwAfTHoGvYLKes+NkLPYcXqX+/PDOp6nprti3DHW427T0AM4+9KaqWNa+prYEvdxuDH/
         ZkqG+30K564i2dtSnWsF3VQHdsAdZnWxqSxHRzeKLVaL8/3bFnXkmHiu5LCl1IyIiZ8Z
         O6UqZCC1/I4YGKeFDA/oBZ2eBirfPo7cDQr9kPB02W2w3PWbVdyrKzqY1+kXV1Z0QitT
         tQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBwmgSawIPNu9PuPYPz5RzO5uL+VX6UDgZT2g/rNLBfXzUvIGObixIIM0JuEooTCsdUXV2dwamC5H4@vger.kernel.org
X-Gm-Message-State: AOJu0YwrWdEI4q+yeNpIIfr4hpwcQEvlH32JdtjEH4DUI89brroqtr/i
	aFB89HMSjqlOlGBIU84RGQROPuOLq9eY89PWZk5VF6IaMQ97+r2dnmDdIfnuRKRvWrwK8xYTT0H
	JNPFrIhQAu9iIybmia+CUji95OE1iBSw=
X-Gm-Gg: ASbGncsNOWmiJ2LDHjjtv/kaOCXDndWtZP8xBrXkwHU9BPhKTBPNl2sZvv/Y4K/1kfA
	3ic/pWuYEmNBq6HNy0ueGHYVxKWxX05FKB1nYkLTcdAAj6RiBd6vUZqjskkrE2/kteXAjD6LT9z
	AIxBs42DoDlyV7Oe0OLb8vnyzgs2edgGgLr0OxrKqkU86KAhAd1YhYh1+rWMUpUgZSVW7kzPkAJ
	9Ay4AMsES3zPCki3swUZ2PDirQ5gy/phgcFzzhwaGUINILEwmU2oeHmco+ljx40ZOVhBrFla0to
	jLCore74Ctu5nA900kn11OUlUtOvJ4gc4KDvCjkrI4foO3BkI9FZW/rnq7quUattysCZ/xJ/XFt
	rytoalZYEVdlfPw==
X-Google-Smtp-Source: AGHT+IFf7MsVxgzAaLMfrcAu9oP1ypCD1l5vYGKVDQF+ssx3KpBLarOL2v3Sp6TMg4K3L7H41F9nuwSgrOl5zJxS610=
X-Received: by 2002:a17:902:ce8b:b0:295:304d:41e8 with SMTP id
 d9443c01a7336-295304d4876mr88981055ad.6.1762214402530; Mon, 03 Nov 2025
 16:00:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104105516.40fea116@canb.auug.org.au>
In-Reply-To: <20251104105516.40fea116@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 00:59:50 +0100
X-Gm-Features: AWmQ_bkGRFs_UNGZ5EtKszuymNzT7RTMbJB-EoXQOOisJ_XgxgKjCesre1kTg2k
Message-ID: <CANiq72kP0YMCEMjEVdTfVt4eokbXm6iRAk2PxmFZybNgJaFzGA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the modules tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:55=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/str.rs
>
> between commit:
>
>   51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions"=
)
>
> from the modules tree and commit:
>
>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel


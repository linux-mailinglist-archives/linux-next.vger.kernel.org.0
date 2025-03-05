Return-Path: <linux-next+bounces-5660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E41A509EF
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 19:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 006E67A36B7
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 18:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6961DD0F6;
	Wed,  5 Mar 2025 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dqbAWYei"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6232528E4
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741199193; cv=none; b=ubnZBx7NMqshCQhONj9DBUYj314Fif0zGfcJ0TVSOFkGEIKeuy58AEEPIdBsrsLnhZdFyfE4ylSj8NODSI67BHZ8EFcGRA6E29SN66GbZETihiILOGFHIsBi/ilpOEpDsB7p12bctXEogCVaN2pqhwfz/JJXJm306oUHYYWDBfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741199193; c=relaxed/simple;
	bh=VGwMgyKpCt9HHv8lSloTP5AZN+IECQ/wTTW3r2R9a4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjJ2M6sSN1hZ79vwu/aDoZMpdUlgtvbe7SIzUVDuLw7RhTPUQsZ0/yzzVKaXiCOcc39VfCK3sL4cHC+aDFtGGcmtozIGHtx2gcjJqH/ZlqPDWYgqxrqm21a1y4JtyHyUq+Oeje/6H3+dIHC8mFMas05j4M5iopOo5qHj89EJ9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dqbAWYei; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso9608808a12.2
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 10:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1741199189; x=1741803989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+lWuYggNESirpcNjr2CXdSJcsNp4dxN7SSz7x3TDdE=;
        b=dqbAWYei32ON4aDBTAZ9XqrtMSlr2Am11oh/Wx0ptOUag71hAuKg//c6FEGTp98yC8
         4vWOMR+0JwYN8YLvlAmvGkfv9+ynlY1DGrHXAstOpHxn/Gk0dfHFOUzr4v9DIuJBH2q9
         PbRbW71H4wXz+aX8WL7gFdX3zvMjuFVtxqrLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199189; x=1741803989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+lWuYggNESirpcNjr2CXdSJcsNp4dxN7SSz7x3TDdE=;
        b=Hj2rLuYnNzMnorNN118YSe/riUEMAvKiXkjGRU1+wQ+WYR7gCBH5FNfc8UaB4rO185
         mLUMo530nehHs2Za14cjpjhOlz3nEkH+vasRkJJroRfW3lFxHg0MAbYbKq0TIBzWWGCl
         9ixIpCv4sTQKDSxDMMrdWYxCmBfVn+A1cty6cpuWcu/zCUx1w1ceAK2JMp9tcm+LMSrP
         x66LZqFERqn07FQ4seezdJrew8sj0Bc6FgM8qPIem0yQGtbYrSAFlf+vyKlLod2nOaGY
         9R1nM5wHh+zBx4F99elVZmjKQckKcrOyz+DkP8XOYBDLU4HK+mKrhj0X7larIo/7Nl8L
         KEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm4fJ5Q+3r9JFqfgw3n3qDMvQII/n5Q9DuKBBbim0Y+zSa7xYGcu81Cj/Vw368VhjF4+Oo9lVLTiMf@vger.kernel.org
X-Gm-Message-State: AOJu0YyNj49g5e2cd2NJhcW4IUuSPuO8MXX/4vyZBWJxUyOAX1Ra5VUw
	wAF23206k0WtmIV5dhAgb6XUZxnIPKbWM7vGnZAERIN7tvBLZMDZIN95RtZetKYvMvINdsYOnt8
	lWaNrAA==
X-Gm-Gg: ASbGnctJDgwPC+hT4JhCEXCitvRaGN3iWwhfSRhH8Y+njfKMZ9Y0bUJyXykWnjvu3A5
	r2cAG+S+w6XVMh+4CFpiL2GLjEOJ7o1/cry29mLj4P59/7mqRtqZl40gT15opHyq4htMCcULQDn
	57HK4ZINku9281H+oGic5XbtyrhieCF78m/ogbsJ0nDBjQ1Bh9p0evdPGiCSXPlObWAEFiT0GF+
	3ZVO1t07WzxX7ei4oZBhGEl2AeUmVfFycBc+FQ5z4+/hIEIETm37z2P6YbD/O1XE99dvQlzYF0d
	+6SxbYK+yucZhYw9lBdmnmuPhm2epi6GBHJVSiAszOpjxQSombU1KoK077teiT8pE51lLpvGLcO
	rAC+JdLmnSzz5ETAQrTo=
X-Google-Smtp-Source: AGHT+IGkgRVRpX/J9F9cMPr200VofSE9xnlheimCdTcL1wsSTaNTdmJjATq8TtpJPbxHA/MGjCWOxA==
X-Received: by 2002:a05:6402:5290:b0:5e0:348a:e33b with SMTP id 4fb4d7f45d1cf-5e59f3c203bmr4200004a12.12.1741199189539;
        Wed, 05 Mar 2025 10:26:29 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a668dsm9843218a12.70.2025.03.05.10.26.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 10:26:28 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5b56fc863so976842a12.3
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 10:26:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3jZfEyPKimAqL5QSqJyh4+g2iTGpPq3KeKC4psnXeBzr2BO7QWPoz8IwQUoX2QBzft1AauC65IftV@vger.kernel.org
X-Received: by 2002:a17:907:3da2:b0:ac1:e1da:8744 with SMTP id
 a640c23a62f3a-ac20da862abmr386757466b.38.1741199187743; Wed, 05 Mar 2025
 10:26:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305204609.5e64768e@canb.auug.org.au> <20250305112301.2897-1-kprateek.nayak@amd.com>
 <CAHk-=whuh+f8C4u+gCkxRZyrt7Gw_FFw_pKn-2SnTovZOvEKmg@mail.gmail.com> <e6cb4e60-9525-4d42-8912-7ce3f7fa4abb@amd.com>
In-Reply-To: <e6cb4e60-9525-4d42-8912-7ce3f7fa4abb@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Mar 2025 08:26:10 -1000
X-Gmail-Original-Message-ID: <CAHk-=wivSEhRG3zJHd0WYz6rO9Gwzek6CMRMSmcHd2c6-01KuQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqpKUUFPnHc3jSY-R0TPnXsPYIBThz6_u7E-ytiat3EmHPTia73VBP0gTI
Message-ID: <CAHk-=wivSEhRG3zJHd0WYz6rO9Gwzek6CMRMSmcHd2c6-01KuQ@mail.gmail.com>
Subject: Re: [PATCH] include/linux/pipe_fs_i: Add htmldoc annotation for
 "head_tail" member
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 08:08, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> > And it turns out my worry about pipe_discard_from() was unnecessary.
> > Yes, the code is buggy. But no, it doesn't matter. Why? There are no
> > callers of that function ;)
>
]> I don't see any in kernel user of this helper currently so can the
> wrap-around issue be addressed and the helper be removed later?

Yes. That's what I did. I still would love to see

 - more testing

 - explicit limit checking in pipe_resize_ring()

and then I think we could make CONFIG_64BIT use the 16-bit
pipe_index_t too (because not doing so clearly was a mistake: it meant
that people didn't test the 32-bit case, so the wrap-around bugs
weren't as obvious).

                 Linus

                    Linus


Return-Path: <linux-next+bounces-6882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82AABF0FD
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 12:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BDB1BC18A1
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B3525A624;
	Wed, 21 May 2025 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="IjDzG+Dk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79E25A353
	for <linux-next@vger.kernel.org>; Wed, 21 May 2025 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822171; cv=none; b=QN+LgTNKsEbhr3ZYAlnjjaruiXMDJiQpG9cb7xHGXXi8mTZU6EVRucyHmJnL6MF5NfRaDrOJrlJu9aWAuurscd890IXvAszkcXBO2oRzOKSZJvLSRsGOnGDB19eErwxjvfj+cFimNmx/oOvFWRTpzlM0hBVzBdWAfSbybAaUlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822171; c=relaxed/simple;
	bh=T2ohZniJWBi98PVxpm8ErkwXwbAvhGQujUtaKkLYYH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwJ/tPFcmMky+aEgnWA0NB5vyXJ0kJ2HYg7My1UhQYaVk0dLwIvpghCb+tlA1P81ZUeN8Rlce52sg5sbiiOoKXNsdr+XKzcPWq3eKkrvzGrCIJWo1v9cD4LVCGFhpWWkZYuRfa3MmRm2MgRUCllYrdFyudcqxEmGbmwoTfmVnuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=IjDzG+Dk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-232059c0b50so37033455ad.2
        for <linux-next@vger.kernel.org>; Wed, 21 May 2025 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1747822169; x=1748426969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYGknq2XTmKqZ9GVMDYnnP5431Y08W1eWrL73PlrmDQ=;
        b=IjDzG+DkhkWIOAF0mvkcvdLqQsTtX9XN/BNRwiKdhp72NpstjGYvy8iiYiP07/tT0E
         AhiUcA1SPIRi8p4htxlxZZiTw+GDF82MzDoAvjm1KtZS7q4n/uTAuVdnvOUyi4dP18VU
         3s4yWjB8qU+PqzJxq5w78FreNTLDy3CJ/WDM1mQbAga4yNMb/8X4QdV5sX/N2isl0OiS
         jDNUYs0CoDeE+0EexqocgXYf5m+DgVEx18UThBNV6jztjDrl66ixnbEHZYK6d4/tR6rJ
         DWykcVcPbAI3wIjnAw1nVh3FTQqLVY6mHNe+aGc9BT3esY+vvS4B8Bd68E0pX9T2BQr2
         MhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822169; x=1748426969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYGknq2XTmKqZ9GVMDYnnP5431Y08W1eWrL73PlrmDQ=;
        b=dNSvYli04uDKoBRDXBME4Oq8hEFyUMr2zU18xNrG8HlpaA+XqW6v+f9+6+OX3ll7ol
         Hfa2bdKEYJEF0aXtXovonfgG+LnN+xjzV7I1JXqNynxTT8u+gq+MR/av5OBsQBtaO6hE
         iTITj63yVDVp2k0/sBVR5k62Yx9ce35ShOGmo4FXPZx++ONTTNAJaTic2/9CEWvzWxur
         PYlbT9j644nHHvUE+Df4z4hBiWfQlQNUztTj2lqcTQrVy9pGdsh05uBNObqAyeraeJOI
         NmEzJ2P2Aq70VlPM3RbKBe/WkqvbmsNlz5duFq2WUs6fds0mwD6MCYFNVXmaT5YEHjT/
         gtxw==
X-Forwarded-Encrypted: i=1; AJvYcCUrKJ0G5nSGZ0LGKfFbidipgUGfD0KDwuU2y4Kq4FBre8b6IQBm/pH70ZkjdBxw6bs2vw6kiWdBwmLO@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSL98x0Fu8SuY6UduKisQ+t4TZ9nOjn8Tun7+D0BOa+qgK7wl
	uHESbWsCrhKkhRoW5VKT88Oo7GtxjC6fsayV7uzeTdmJLSJdH82Dtkxql7nYQOxMEUXqeiLT1Mn
	xuikfPwFZfQZvMKuAFV1h/vfy4eFDmF2RE8GVIITyE51bVXVfi8NhYg==
X-Gm-Gg: ASbGnctgf9nMK6rvLljSTmqkI7d8dNdLpo0MKI9pzQZpRYCmm1P6ACQn+bfyKMgLvLx
	ixgtlF0x6wpn9Kog28+puRdbI1RRmg8ssMXcuvcTkE1GvbD2p63flxKD9614ZN6h/qX+ogC3ybw
	kRjKq6Y0maUrOKVYJcoFbAPmIh3UDh3hstkJJbrN2vZW/i
X-Google-Smtp-Source: AGHT+IHxaq57x4qvgJ09saZBZQthjkNcpgYB/gaf0cvHhyJ/IV0TqlMsd6tqs8OeJATTJ07pkvn5esWsPDCQY49Kk84=
X-Received: by 2002:a17:903:11c6:b0:21f:7880:8472 with SMTP id
 d9443c01a7336-231de370156mr298025245ad.35.1747822169450; Wed, 21 May 2025
 03:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521075357.0e34ded8@canb.auug.org.au>
In-Reply-To: <20250521075357.0e34ded8@canb.auug.org.au>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 21 May 2025 06:09:18 -0400
X-Gm-Features: AX0GCFu4Vg0xRrfR2zj0EthKnbD8HeN7pz2lAAiEnN1jZW6HflKtoS-jmJ8jA7I
Message-ID: <CAOg9mSRCmCY6zSDGwFz=+XDvJQcwe6k7s27h5uabqD4A0592Cg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the orangefs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Marshall <hubcap@omnibond.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen... I asked for one of my patches to be
pulled early because of a regression... I'll get the
extra commit out of my regular linux-next tree today...

-Mike Marshall

On Tue, May 20, 2025 at 5:54=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commi=
t
> (but the same patch):
>
>   ddaa7202a930 ("orangefs: adjust counting code to recover from 665575cf"=
)
>
> This is commit
>
>   219bf6edd7ef ("orangefs: adjust counting code to recover from 665575cf"=
)
>
> in Linus' tree.
>
> --
> Cheers,
> Stephen Rothwell


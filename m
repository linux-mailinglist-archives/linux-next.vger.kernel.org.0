Return-Path: <linux-next+bounces-6134-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD16A783C7
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 23:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD58C1890435
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 21:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054351E9B3F;
	Tue,  1 Apr 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOdiRJSk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029B1E9B22;
	Tue,  1 Apr 2025 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541452; cv=none; b=FGc8CvXKfksxusrJNNGtpzUcyphP6rlM/mYp/QiFuQgJDIjNinhSV0YSXi/RQrZ+D7ZZFzpGJ3pXSsQf3iQ94Bqwuhw4q8bVpfeMcwDmRrGuIDZkCozqxVRMid1MqioD5/niaH0ByfJXXUlIuYY2S50avMtwMWUO6ygBkpMUHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541452; c=relaxed/simple;
	bh=JF9Ae4QGiMMNa2DHcHPi3JuU+7gAXtggiKzVEZAVomo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfYPPKkJfWvDaRvpxDrnvd+xCk+BXb3VDF4fuVCSYFzHiBxj/fYL/Q+UEY9TpPlTBUFT8iDo3h2r306xMVwddZagMFjaIO3d/4uPJ6uo9Pk9v6MROntBlEuHBunSqkk/9CMfLD+Hcfy7L9uLmhgLkPGk6n1MUEs1HnOI/SJO0Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOdiRJSk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6CDC4CEE4;
	Tue,  1 Apr 2025 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743541452;
	bh=JF9Ae4QGiMMNa2DHcHPi3JuU+7gAXtggiKzVEZAVomo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iOdiRJSkXCia5suaUg2PvHNrqcyPmtM6b7hpCQp6Towl8YTAtsullje8Vk7dnFVuA
	 oSL8dgf7FIlS21kIs+m8PSkq6b8PF6bjdCwv5kRi7T2k4iD8opyyWzrJ/ep57MDqKx
	 dhNnCqNcaai7v+dTGUAKz6HpNTITYs6LdRFM8sSvlF23lMxbXjaIq2HxmE0SAaqajb
	 AezmDMeUPAvIGJl+JBAzFMDy4T6L42rPzCd01ZCIF/djufNFAf2cGSz5bWM3aLxuqn
	 UI/CmRCj9p4KkEivPTQ2dKUChGqA5unr9uTaaycM+6UwF5ciGzrroXcDAdJt1tQ2FF
	 /97pNK1raQJlw==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso5551604276.3;
        Tue, 01 Apr 2025 14:04:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqNaEKnnkAkm/Cl5aH0mto9nXSTjhxSuCsS/rmjsWnOAPCD80BezbxHN5zAa4wsTzXnw1HU2ElTThWOhY=@vger.kernel.org, AJvYcCUxt+MXjwZnJn+gFid6eiJwXBpVApciUPqWPnpjSFZvb981vvAHgAWlg5wwCa1jKgAEI026twE3joC1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRyi7tirXEPGIbv1i1HLZawDTntZthPE/ZM5MApUpPu5hJhZe4
	rex+6zfh/C3naNIQNX5KwkT064hgCxLefpf/tiSAdfxgQqgQph/Pvusv4jPzOnjYuf/7LfaBKGF
	wGAQwunfhLohpOy8CKNiRUSO7A9k=
X-Google-Smtp-Source: AGHT+IHSBPPxUBhWOzu4Nd87QMvwOQIaWIMiEd23Z6wQ177CV+d/d2HSMj10PYMxSsvBq1VKMKUwav95p4z51NJ8Hb8=
X-Received: by 2002:a05:6902:1084:b0:e5d:c6e8:2e32 with SMTP id
 3f1490d57ef6-e6b83933edfmr18586104276.24.1743541451490; Tue, 01 Apr 2025
 14:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331082507.36ffa10b@canb.auug.org.au>
In-Reply-To: <20250331082507.36ffa10b@canb.auug.org.au>
From: Fan Wu <wufan@kernel.org>
Date: Tue, 1 Apr 2025 14:04:00 -0700
X-Gmail-Original-Message-ID: <CAKtyLkEiE85Nn1Jyy0m5NdyFvgimr+uNnSxJREO7pody61dkdg@mail.gmail.com>
X-Gm-Features: AQ5f1JqKWXVefsA1QoswNnUARdBbeJNepSfeaUBYmyBHkxnjYeA8ChWRtGWfr9Q
Message-ID: <CAKtyLkEiE85Nn1Jyy0m5NdyFvgimr+uNnSxJREO7pody61dkdg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the ipe tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Fan Wu <wufan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 2:25=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commi=
t
> (but the same patch):
>
>   42d4d6207180 ("ipe: policy_fs: fix kernel-doc warnings")
>
> This is commit
>
>   6df401a2ee4a ("ipe: policy_fs: fix kernel-doc warnings")
>
> in Linus' tree.
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

I just removed the upstreamed commit, it should be fixed now.

-Fan


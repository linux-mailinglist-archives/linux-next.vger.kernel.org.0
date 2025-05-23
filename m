Return-Path: <linux-next+bounces-6914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F4AC1FEB
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 11:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AAC501429
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 09:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36344226CF0;
	Fri, 23 May 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCMZG+DB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4A22688C;
	Fri, 23 May 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993365; cv=none; b=CQ7S6gjVIy7CLZCdi3/ERAwleuR9FZSpwMRj+WbKRmLIA8om3DhEKF+grCx2EEyUEWSFcbgGofbY8RxNwc9jtPdxasrGQGJ8lVi+a0u8/LEAlTHmGYfzPZOD8Q4PJaw0bBEgMyjISfv4aC4Cr5qG5UwF7PAtJNKwX+DZ/YHuIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993365; c=relaxed/simple;
	bh=vb3hnbNhPVqsqt7REDe0gUU38912UvdOm6JpMsOvinQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC23Qw2c4Er3qT61Fa2BS1lZcrYDmiq5RKt/itZnh64r+JqR2p69lQhI4WOAoEZgsvLS1MfjFLSnfjGpuZDIlgosxDQK4YC7zIyAr9y6tayEiK9wr4yuRVodyCS6SLZqKvInGp21SA7LjouNT/2M7bmoKG6+fRilOMZJEQ29HQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCMZG+DB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231b7b21535so6192215ad.1;
        Fri, 23 May 2025 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993363; x=1748598163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuYOwYNKkjdOui7VOKdqHSaUlWRq94p5a/W5tYRRzKs=;
        b=fCMZG+DBf1iNZRQSRT/ytAHeJFBX7+dsleupK6jT2gAWbyBIewGlSFVgjDebCvz2Cs
         IoD6oi7gwtFxFYYELlekiCO8u7vGBFD4Yt8USFL3zJj35fl+jNpxDt9VP9V7T850zZfU
         E/HvBS946BFQZE0qa5L5K7V7xz+Z4z+h/naNRrUECw61LSFrJeUgPRdFyJFv3RS1VkFr
         7EOa5C40hbPiKE/nPxvuAMgJlFxQbDRS+ZDuAeDDyedTmEqEtvfXAF9x82JqCVPNFi44
         PC8WycIuUkFL2Gut4Jk72+p+yMsuNu351h2fWHpgVI3+9ofkRcZnS8h7Y1B64C8H1tpx
         wKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993363; x=1748598163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuYOwYNKkjdOui7VOKdqHSaUlWRq94p5a/W5tYRRzKs=;
        b=fxQ0kysPrVEcm25HWMdMr71I4fHR12/xdSbOOzq2nE4tMA9Vmq35O4ngvERuwk9aEI
         4i91tRKG1nBtmSoDnKOs+0UcPUK107/IpQFp8wuUyg8LnkcPy7a0Tvrz6YLzR7TUjU0f
         WWj0cae+XNk9dRyKkWDTwK1SLKuGnfHIigyC7rcw7DuzppZ9qaOGFfvaQBqJ83lPu0y0
         pWYBp4ACBAMSSSDHdVCRZrRXLC2BT1V4LOdYibi0KWxCKeYXNxbyy2mlNd+q7MNKAL1B
         FmAeujGHmZcGU5mR//qvIo+k/85mPrkxRxSz7Rk2oGU1aY2tJBKPNcN+i0H5GfQIkCIQ
         6GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbMAW/KH4+mG6gT4FUEr+dkQs8A7C1meQ7QrVUKjU6+Wo7pl98YlHfIanfUPVYhUx2rCyKt/Mx5EoGkQ==@vger.kernel.org, AJvYcCWgClMlt3WYwOeh/YWMMFKQ5kp0U2vUlcJGT6T7OpjWjdzWlMf6a5DTYg94aEv5kzFSlxZ7N1FN5uujivc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQAxUOgyr2XOP9WMO2sHXtqepQ21x/X+BSDPhTpyFv1GOwC9W
	3qyh44d9WpzbkiCJw2njyhP945Z40pPPRaasW7VvspxcMFiRfu9keyKR9SYXP1SF3GL3FTYtglA
	ad4EYJby7Jl7SZKZSbu5B+6glF+xYeJs=
X-Gm-Gg: ASbGncu0wIxoOvEzCR5HRU2lA+0qPqQq6T5UY/F0pJuiizmh7R3e94KjVcqXxukmKTB
	I9lHzKAGCv4+PvTrt2HnV+dS/zkremMEOu5rDmhlSkIbl/AVWPtWRZNpJLcmUL5fmgOahtVsFKQ
	y4dQLckc2ElP9Jljkj7SKl0ErhEc8yXMrU
X-Google-Smtp-Source: AGHT+IFe4aaL/Mp0H070EexcfB77wVMFn2+CLwqQYYEiTAgH1Pomvmo/SRpI1wyZnAbR19rOKvsY4ac93WCFcorj+hM=
X-Received: by 2002:a17:903:1aec:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-233f3667693mr10262275ad.6.1747993362953; Fri, 23 May 2025
 02:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523161352.20f0589a@canb.auug.org.au>
In-Reply-To: <20250523161352.20f0589a@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 11:42:30 +0200
X-Gm-Features: AX0GCFuVagKgyX9ZdyEuk7oU823a5UTijwUK6Yx4xSHdAX67f5__CmWx2DVQEvk
Message-ID: <CANiq72=Oi2DXMG1U439RHYbCgRAN9L5d-0Dkaffi1d=mec5LTg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>, 
	Danilo Krummrich <dakr@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 8:14=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks OK to me, thanks!

Cheers,
Miguel


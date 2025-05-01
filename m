Return-Path: <linux-next+bounces-6486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7ADAA5C71
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 11:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2027B7454
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 09:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BAF1E8345;
	Thu,  1 May 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnbXBwOM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F8288DA;
	Thu,  1 May 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090162; cv=none; b=ukugDtMKYmpz6zFpOF3Wj/WUnA2x4CkIK8vTMwT/jPGNYRgHsk4N7MKerIazVzNuubMdBgbJwwL6eGhHN/kU3QUAeT0wb4qZvKyfthnvf+tf2nuRgFF7jmrirZ4zS2+NFVw71j8P5IE5UXlY0zENjo2avVoOLF95UFgogAi437o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090162; c=relaxed/simple;
	bh=aikn57OcPfZo0b/VC1/rLCnMcVQbWV+5P1/sP6OfPMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSZ0mXzlSebT3ClZN/y89embbYU/5wrInqoCl7+GPcQycxz3XERkb+LCGu47/MZyb6DdGd6hVeKGn9P8YhhObdijfy+D0/LEuCprAZLyBwcJKXNIGzf9pGhzEeoLBosaWC2ke+Ocj02Whn7v5qi26qfkjvfE+3CmoMEiX3kSEzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnbXBwOM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3087a70557bso103655a91.2;
        Thu, 01 May 2025 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746090161; x=1746694961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aikn57OcPfZo0b/VC1/rLCnMcVQbWV+5P1/sP6OfPMI=;
        b=nnbXBwOMhXMrEXrBeNTISwAS6ST4BnjV2QAvaOVYCQq+f+4eJCi7H/binaLrD2/vgR
         bXV6amjZP7Lv/T3JCNQ20y5zukDL+ea/awojUR/DmC1/83mEWTauXnUpKlfPdQwttt1m
         mpRLTyF1odkmK1Um0/+BIwp+vQ8HiEshYhQN7P7v77AgfAvz67HQKONeUW1TpKPoYIK9
         T9TSRlLdWTU05SaJyiikS+WSWB5eVfNrLxU5H5iO0ljCHES5B52XkSCxgb4p/+bhvPSm
         gSDYXctIWCNr/iis8wnbqj5cH4gx5Tuk9fjipNs/mGCplBjA5DqAUQVsLmTizqeg+wnm
         57dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746090161; x=1746694961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aikn57OcPfZo0b/VC1/rLCnMcVQbWV+5P1/sP6OfPMI=;
        b=JsjAKR2Bf2Vg7E9AMytnkv0JcxFGxJeOn6QVieuwHvjHjYqUTKGZIpx8d/4cYnDtj/
         sIyBOt7SobA3GsiqXL6ZEXNqDSeSmvzrpEaNkIsWmyHn7G/ndm96Vjg+lpRYoBv/Odse
         0zNpTwjeZrdn9wnnx9/Y+QRRlsnZ1TzFB1TWRI9GvRpU6hHtFaU8WjfW0Vrty7t5xhBe
         zQoZF9w1HqeKYVgjg+N4v94JKZaoUbUQSa2miyI5PVUZxnvHAYJddrW4HkrZLXQcyFUN
         kxesY0CRuhgdw3CgUoXkscyg9BKyU5QVTOM04DI+azJ8DM5zPnsK0vxsDPDDgw1Oz3AT
         8O4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtccOdG2MHrp7S7hOn4jGk74NmzB6Vkj6RunaupGPB1oDj3THOLw01XZ/k+eI8zSenInOrGo+AIV+TiQ==@vger.kernel.org, AJvYcCWy5fDWOl/WH9hDvOrOjWUxoUiaFBZ4m2+3f/g+tpnZNtSqel+PJunZlo1qL3Q24PV/vetCJLqWF9jkN4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPBk+DFRErQVUh9rmklzPZy7qCz9m7xVu07o1HLUCNCrd0KsS
	JdbZpqK+IRGpWU2ICkcGttRpdMB5LaOYrNxIbN/u38f/XxbNstSUIbrOKY2lfD6o5ChAbxOlXWj
	+j24wNxyEE49Wqrs2VFtYmyalB69Ajl9L
X-Gm-Gg: ASbGncsIQAnJy0HUK+fT5edl6T66itacfYEwbrdh/7Mxsn6fWc3oHYemXzl8LkqNR5L
	RPfjlIPpw22F3qW6kbWTvOK05peQ5h2yZAAJP+av8jNqNc0uyp4hCI0PvbeyrmgQz0S1vRM2oDo
	o32lKgtp5q/uKxW/yzZv4BLA==
X-Google-Smtp-Source: AGHT+IEynVgXqKj5wZVHQcpTrOK/PaP7IjU+M8WWkEwyezewAJ/95tFY/SF3e+V0ZQ4tVFSzEQucR66JpGlNyr2Ib+U=
X-Received: by 2002:a17:90b:3e8b:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30a348d7896mr3408670a91.0.1746090160627; Thu, 01 May 2025
 02:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tAJ0jyptJ0jLaRp9siDw8y2iw3S7GeuC05Uncum-qihlIKfCfEVhQbGNuTengQ0kWpnNp7OoTITxbEdf6nDTCw==@protonmail.internalid>
 <20250428203943.51dd39d5@canb.auug.org.au> <877c344gmp.fsf@kernel.org>
 <20250429174451.42a368af@canb.auug.org.au> <CANiq72kSReDcMU=eezmgsREL5+1FSnq9_VuEd-8AtU86W6UoNA@mail.gmail.com>
 <20250501183210.639f9abf@canb.auug.org.au>
In-Reply-To: <20250501183210.639f9abf@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 11:02:27 +0200
X-Gm-Features: ATxdqUHvvEUmhRCQrVIDL7rvOu76D-SwIoD7BSOceuJajlu_iOzhimfMuCLMWks
Message-ID: <CANiq72kgPJvGpgUuXE3owxMc5zFuK=wXgmSM5nyKZf8u8+jtEw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 10:32=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I will try to remember to run 'make rustfmtcheck' whenever I do a merge
> fix up on rust code.
>
> (hmmm, no leading tab characters - who knew :-))

Thanks! :)

(If you run `make rustfmt`, i.e. without the `check` at the end, it
will apply the changes directly).

Cheers,
Miguel


Return-Path: <linux-next+bounces-4971-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B873A9F35E5
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 17:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 110A316307B
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 16:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CC82040AF;
	Mon, 16 Dec 2024 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi99rkKV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1301FFC44;
	Mon, 16 Dec 2024 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366296; cv=none; b=GPn8D1Cbl47x8e3bU17a8VcUGJY7L3jqZ0P3eJf2l9PBE2Z9Q4pTU6sn1FEGYMsFGH/7yivbQ2WyjkwfgYaqssK4tJjHQA8YCjhp3DkdkJk0qRDd4hjlJrY48+Hki+bVlAhijYktP4I/vKKbfOkaPUqv/3RpSVbROUhW4mPrKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366296; c=relaxed/simple;
	bh=fLwgD91ITAbfYLmZ7uaoGuyV9MoN2ljajNO7zYF6dGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C74ucp2NcxgzTTFBEta9Yo89QpAR8IohxJ9Pp83PnnlEdFuaXyJAzwlg2cWca8mUL+vsvSUcGHG1sVRwjs4Ge6i/dpuCFmPHT7Qo1dfDkT+2wTyo7Lb9LjUc17VdFw6QMKdK+0Mp9DApXtvCxhUh0SqPa44Q1BGCcUxvIQ/jZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi99rkKV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fbb47b65d8so266933a12.2;
        Mon, 16 Dec 2024 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734366294; x=1734971094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLwgD91ITAbfYLmZ7uaoGuyV9MoN2ljajNO7zYF6dGg=;
        b=Yi99rkKVh7ToMmgm7cZOyXeBHQS9mAL+XWbXpnS1oYBo1ZHnkm8VEIR7qPRTC/E+Ar
         xnDm9KelsFZYrl+G9B05poX2Nx83tGitlU6DpcqutSiiaNHVo2rF7G+V893KTvarm4NM
         fxaRnKs8NFgk3FJhPzLzz3E0WcPjDDfPxPKaKZDvsC+3f8KjP6OMAkeuHAGqkU7zYqDD
         xFqD21F2T7FHn+GspweXoL/1R1TlSAHXgrZfGf3dy5fWJpZiwm5S1vXtvhpTE/1FtP+I
         Hrubccs7SPapRv8YH/hX1iIRtHyJxzSCoWRhhKCz/LAaZtwnGlg2b4TUVcaLI9Mg4Ewv
         9wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366294; x=1734971094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLwgD91ITAbfYLmZ7uaoGuyV9MoN2ljajNO7zYF6dGg=;
        b=HD/1cie39pi01QDCgeQzo4n8loCQ5KMLJ1YDEQXINzZSRBKGsfgG77T316gy7MyNfL
         KThYGZPSVHKmFLZpUhvmf4sgkeq7kkDqIK3RMnBS49NW9ByRBQ7X/KKcbB3q5r2RhAWp
         4KWHUFXNlZ1aVmXdi/SftDAbRhAmv8p5gzhiBlFe5qndNusePHZ9U/j26in8yiHc+v5W
         ZIyF9+KI8WzxuTw8Q896zRbaDEIvnaiy1XYkIlBWSCgjGBMxq4qUalOxAzJlio4m4GPm
         DTLcRbg9X3OKK1MztYUMaIu/FevDVivYgEWEEYVycZOs7W3EI6WJyuL858r0a9OzoQ6N
         sEOg==
X-Forwarded-Encrypted: i=1; AJvYcCXFJwemkBW3gSjT2nT3p0TF2pKlHqDMzq9zzQlfE5kBct2aejR1a0DAGMiLK+T0Uk33rjCHo26SQdJY/g==@vger.kernel.org, AJvYcCXR/5cxbs9B4vG/nn1P1i4ywj3upT/UUfwgX0kiKl7mfGQWCNV/7//Mhe4xjVUweoquISnev7GjmkQqGqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdfXREGRWXViI7I5li1tGEHIWm+/KWAna8/6YouOuGLL00xs2
	j4dvWMvTuVfnwrrDbE/+eH6wHApRz/5ySi23CS7B3FVQlbni1DNqHlmiZTe4t3Zkx3C5MN7fo0p
	kDewD7RgxtDDt+dHhzyGC3Uzef5o=
X-Gm-Gg: ASbGncvwV53vOeNEQ72VFpOvTV8CTkFwsgbF7hsNO2BpYamil7MSQNNSYRWWxMLC/et
	OHMk7GNh60cGzNLRyaAm44amwEvBkz+RI2UmVUA==
X-Google-Smtp-Source: AGHT+IGBaZTwiys0SehYk/HD4cFQMugwK+tb7VoLd8+Y07ZAUbeAUYFScceJi2D2TgknJbyzLaZP+8MhjeuXYUEfmLY=
X-Received: by 2002:a17:90b:3509:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f2905b4479mr7150066a91.8.1734366294515; Mon, 16 Dec 2024
 08:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216162512.064724b9@canb.auug.org.au> <CANiq72kv-bjeHtnom2xLqMD92xfogd1hm6yFGg16wpqjhJWMGw@mail.gmail.com>
 <06f34e34-116d-48de-88f2-c029877f41e8@redhat.com>
In-Reply-To: <06f34e34-116d-48de-88f2-c029877f41e8@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Dec 2024 17:24:42 +0100
Message-ID: <CANiq72nqM6Ncz7pP4jfyBENK936QXqd0KP-9BQdbHwVU8zX=Xg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:59=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> Yes, I'm fine with that change, thanks for the fix!

Thanks for the quick reply!

May I transform your reply into an Acked-by?

By the way, if you want it as an independent fix that can go to stable
too, I am happy to split it into its own (previous) commit and tag it
as such. I am not sure if it should be considered a fix, though, since
one could argue nothing is "broken" (apart from the type not being the
optimal choice).

I am also happy to split it without marking it as a fix, in case you
may want to backport it independently as a prerequisite at some point
or similar.

Cheers,
Miguel


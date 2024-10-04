Return-Path: <linux-next+bounces-4105-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DC98FFB2
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 11:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163DB1C220FF
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3E01474B9;
	Fri,  4 Oct 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZ5U/fDl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107D148849;
	Fri,  4 Oct 2024 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033944; cv=none; b=Vv5HnZmouYopO2hcddWOj3/PKmSTwftDq0aOJjty25Jek+NO5PUnj48uFzJ2HXzw4BPdCo71v0rL7b6MkzNGcgRFHkon9i0PLzMKTKaLOLE5yd7DpXX9RwBYPPiY40Agr+Ei5VydNLrhNefFj+xY4gN5foJSNcabV7AvoBXq0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033944; c=relaxed/simple;
	bh=TMaz3q3ePPj1xpllTZ2uSb5O82dcENS2Ft/MT+Q7Za8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enNSwb0Hjn6oYJKmj9oUcDLLN3PLLm+lK9c3NfN6bBLXQZZrnX9Y49PLqwyCcoErbOlhvlSJ0KHwoUQZSIb0CKj+Si/xonoc14D92dZPQVnP38bnVElGW+V+uySuiQdwNax9SGgKHPxueTy10KUSRNxPkA1MRglwWe5vLHhyc4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZ5U/fDl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-718e55bca81so277615b3a.2;
        Fri, 04 Oct 2024 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728033942; x=1728638742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0CGLp6iSug1VDJrSsVo2lzt33rnyww5DqPUYjG3aqQ=;
        b=EZ5U/fDl0x04ojImWONFR2VgtSfYEbtbqTFYdQjDrX+95iCSAIlnoBFBU3Uc1bNztj
         Rd4MbRwvY2BqQcDXoKa83BT2IMO59B96i9CWJdyiN9lgDEGcDJKwU1ivJvSQ8Eg3J+SX
         dIlm1tqeQjGivJUWqGwlR1RIg1+2CXXm9SvJVsabo7/xv7Mo+WScebxixqVNis/nxBbR
         bEdUrR5E6yyFn4poR4TptnYrp/dL7B/3TspO/KRcai01MQB03iKnI62pPzb6LPHrVs2S
         nXPOq1AG9CvTnWzEMzanYK6n9iKPlkyjkBndj7uINBUq+gRY/kcYiB9TCkyIizznBv9l
         gQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728033942; x=1728638742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0CGLp6iSug1VDJrSsVo2lzt33rnyww5DqPUYjG3aqQ=;
        b=NW0D6yadiyXKPOn1nHCVgRNgqOdi9xhG8gNXahnR96IdLm/vxQn48V5FkVkKnPaPmi
         CEhIlMZ45zeKau7G0vvqsEmZHBpaylJMeBUW8IJ0rTJG+c4CQljSb8d3oE9Ui5m1o3My
         rYdKeZbG1s9WhffrFa06PRx0w5fdLxJ2+438j9QQvquMQJogHo15ojWah5DwoIGv/Fwe
         F7AJkp5UX7X4jhlLgucztPwOC9NH6kZ+IUqXovFwLZtF51IG30TyOZVY3UqXUlI+1ZMM
         2beMKrVg8IbNPXzN8STHZelzvv8LuySRFJoOMIlFmgPYPEPea2/XTwIjOo0OEHqqp+MK
         Sc4A==
X-Forwarded-Encrypted: i=1; AJvYcCVegL5NIyRl/jaMDWgY/F5wS7QhqShEz6PgpzBkeihJoNy9Q0VSp1ZXymKd7do2yayW361JYvSVMueAS/M=@vger.kernel.org, AJvYcCXFdDQO3dnE9xIUoe+YKtyJkQncQAuY1ouonW/ywNkanCXd8VnYDwiOgZxun0VfOXkhij/X3evK2rCSww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/W+17voQR/WjEHeqMBZQRI09H9Xq6leRaEDQIKBi7Eq0O64v
	XBSvK0AobvQTRJT6mCO2fQstqGQDUpuDLM4eEuIksulXCYFTNJIczZ9DAgaaJHX+ZcADxcxRsiT
	vpwG1N6LYg4casDP/xvGjsytn1Jg=
X-Google-Smtp-Source: AGHT+IHxQbnMsBWe1pl0qkXHuSX/KjggCvevqxq8JY46JqCpmiddZlyGK8UZ6dwTNZDM9sat5QNoN0aqdoFa+CXkQi4=
X-Received: by 2002:a05:6a21:789b:b0:1cf:2be2:668c with SMTP id
 adf61e73a8af0-1d6dfaef1bfmr1306990637.12.1728033942315; Fri, 04 Oct 2024
 02:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004144202.24a9f0ef@canb.auug.org.au>
In-Reply-To: <20241004144202.24a9f0ef@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Oct 2024 11:25:29 +0200
Message-ID: <CANiq72kSLL-=pjDqhe7Ftd8zh1YoQ2wacX+js9JMhiXCdCu-0Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 6:42=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/types.rs
>
> between commit:
>
>   e7572e5deaf3 ("rust: types: add `NotThreadSafe`")
>
> from the vfs-brauner tree and commits:
>
>   c4277ae2a630 ("rust: types: avoid repetition in `{As,From}Bytes` impls"=
)
>   432526d4ff32 ("rust: enable `clippy::undocumented_unsafe_blocks` lint")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks as usual!

Cheers,
Miguel


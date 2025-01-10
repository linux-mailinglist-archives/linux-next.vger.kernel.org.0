Return-Path: <linux-next+bounces-5144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE7A08E29
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CCFA7A2E4E
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FC820ADC9;
	Fri, 10 Jan 2025 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCZDt7cB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50D18FC80;
	Fri, 10 Jan 2025 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505505; cv=none; b=MprEFgd46RkeUsSPrBhhJmsk4dm+1nHDrSRx2MImUyiYLCM6P67czKC9v8jHJCgxSdPPq8DGqYbf5F/iRItV9QdcaddeSuSF8ix9Yz5mVkVH7aKZSbH+nLz3n5nnQofkJo/djomWdE8ix145DTV/8jgXYHCTNz6NVZdG7e/vLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505505; c=relaxed/simple;
	bh=DeEjPfCmvVKqbgoGrP9w3qm86nh/HH11lgtUnaxwlrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JL/kE6wHcAGbZ8gozRdPvE9jQM5mbnQut8MHFGw7BCqPs/dGxyscGw65zMnbT4R/3br8TWsdCJyDUnXK5R+k7KDd2W55c6SiWyCJ65TQIbnUIHWG9T+8V9zw+dsMkuClJcytHE83VNUstSxLPg8ZRL+EYU5j+AKaN6U4/pdBDyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCZDt7cB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so369276a91.3;
        Fri, 10 Jan 2025 02:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736505503; x=1737110303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeEjPfCmvVKqbgoGrP9w3qm86nh/HH11lgtUnaxwlrw=;
        b=HCZDt7cB2cG2nWDEo36DCKB6zVVGPKxTM8FePezWlLvW4swEdjUVOJ+BWWrAPurlPM
         MfAgvYCPis9VvGP8fHEkyuZHdgcXQWTzT+GW2qnj3NI5Vl4OT/IcRiKw3DOh39YYiARE
         rECkj05bz4SbNWnVRxNYarUrWOjCMX5lOr/68KcIMT4oDl8TbrWnj9h8tUrYGixcwwoz
         fJmMlJMQOF05VbjYHSXHNwxIClHVxxeLo8KYheTlbo/qf1wTeyP+MqdtnJofNpTKo+tz
         cGUjJHHtlnymDpIOzOhqgmWea2wn0Ohw22GGFeJm+ugqtS80UjUDVIYQPgxEDjJWufc1
         TMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505503; x=1737110303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeEjPfCmvVKqbgoGrP9w3qm86nh/HH11lgtUnaxwlrw=;
        b=k0IzyXsuOqpLcj75Ik44TSPpOiSzlxFMRqbZBWBZvc3c8j+R/j+gKGNBo/+mYxdl4H
         onvj3aFoxoUB+ZMUJOe+GfrijamRIeW7cwwCbeQLZg+hobqgLS94eLzbgBO5tqsr7OyF
         chi4rpmV08gFhh2anv8FOIVG8FDXwhB53fmSre/KZpM3hEgzOakWtxCTCHw+JxB6hPeK
         75HxW0NbI33Io1FX/Cgek+AT582SN6OzkIgvsGzT0pZzk4FpKR5hq5KmDdZZW9g4wpXn
         HS3RRS3AXw+MlcfB58H0KaarAV0AEtPO3zeTAh1Bas+MFPTEmSMD1kuzOaZVRz6kyp58
         WALw==
X-Forwarded-Encrypted: i=1; AJvYcCVgVp+6Ok3f0/60MSjYyNegzeg0l42/w9u21aISp36xOMqoJSiYI9a6FVAiq0+s3iXmWWRf3UsFAN/K2ys=@vger.kernel.org, AJvYcCXmX0vCwrG5ZgmmH4DWw+fw8cchiDUarZ3SwIfrC020Z4Y0pwPIw4HMPy+e7uuVllI3OlmShjIecNEFCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Bm5oIwG913Repv7esJOQdJ9ilbOLxKkbzb+cgwR+FojG06Gp
	PdOsoCjFXP5UCFzJm6MzRETxP6FArWDb21Y7EWv0vSOna6HK4zL3jeiuTy5WAn7CW/jOEFCj4VO
	DzchubyboX0v2vZmGmaTtmlpmTbg=
X-Gm-Gg: ASbGnct06Dk6ItJc0K9So4IPhszOXxKWOyQ0DbPYPOSBve/CNUQ7m9zAi89FRlPqo98
	J02NB71I1tFJ0uqf/K3jPsOnn4tua2rjHQgRWUQ==
X-Google-Smtp-Source: AGHT+IGh7jJjwLfuacPpSR1mBcYfzMiuUImda9zA+BAACcWVLsfNvvr+IaRFDICPapxeRSCESAf4jbFF1Dgf7oIl1Tw=
X-Received: by 2002:a17:90a:f945:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2f548eb3faamr5307508a91.3.1736505503316; Fri, 10 Jan 2025
 02:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
 <20250110101459.536726-1-aliceryhl@google.com>
In-Reply-To: <20250110101459.536726-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:38:10 +0100
X-Gm-Features: AbW1kvb8wKoAXYsDGYvgLXowkHx-4-zh9-IIq3YlsTNJnmjcXCJ8koWhZxUdoco
Message-ID: <CANiq72=N9RMKRBtEuf8qr1oaNVVtfto2S1wXLPRxzfH5N4q=uQ@mail.gmail.com>
Subject: Re: [PATCH] miscdevice: rust: use build_error! macro instead of function
To: Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, ojeda@kernel.org, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The function called build_error is an implementation detail of the macro
> of the same name. Thus, update miscdevice to use the macro rather than
> the function. See [1] for more information on this.
>
> This use the macro with the kernel:: prefix as it has not yet been added
> to the prelude.

Typo: "These"

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel


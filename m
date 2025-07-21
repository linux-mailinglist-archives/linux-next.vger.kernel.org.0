Return-Path: <linux-next+bounces-7654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97966B0BEBC
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 10:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CA067A231D
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 08:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3113B2877E3;
	Mon, 21 Jul 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0IM/N/d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7C287250;
	Mon, 21 Jul 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086242; cv=none; b=WVayvIzwIkln/+/c89F3gEIwHUvFWj9cH8idBe6GY+gYi+gHTJF5YlljRGLrnULa19w+7fRcmUVDaCC3fiHJaSRB93iT7Pqsz+7u8PyoR7kr35zBfxLwcReckYDH5XHyTFxZSTFEBccXildM0XNexWD2GZ7xE+hj3Gee5tT+1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086242; c=relaxed/simple;
	bh=FDFCEBUWzzNDRkGSZ8j3KDIod9rZu73k73JdlTNcmQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+OrJO8ETNLld4yybWOn+/wjZ9Mvc+0ll5yu1anA5ICSIJA83Qt40kYZ+e24oYtbttLPWVgm2ERDu0cQOIhwCMClfqTROu1bJxlEnT0wH3Pzh2omb5oTzvK9942d1s3S26Ni/VqsYn25uakHDOCRak3AF7zfqTN7ULWWN69xvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0IM/N/d; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313067339e9so849595a91.2;
        Mon, 21 Jul 2025 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753086240; x=1753691040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDFCEBUWzzNDRkGSZ8j3KDIod9rZu73k73JdlTNcmQE=;
        b=F0IM/N/dp2L7i48bygY52zM/3pgMUbUQ6Pg19UvvUEVcJS1hx3x574yad0L6OFulRq
         WtV3niNtVfHBdXWyX9Dhh5GVghuVqw9HqbFVQXvB1QiicWD6lO6S/5nVkPv6C1+pYnK4
         J95dBVvi6GOJN4cK8ZQ3LgwJzAmF/g07keKxvDhrHV754VNxjRNLGsmF4lIGJkza60a1
         0aRfgeXCiDcjEcNf0eU2bd68dHTDaC2ziJcliOUmj2tsKc7FOD81Ocn2JV9yfQ230GX2
         kVZdJh84OnkQ1LZdEC02Kmk4qFRCFP5ZapJNC4gT7VaMqRrHdUC1l7ytLmo1zgH4YK9y
         NQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753086240; x=1753691040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDFCEBUWzzNDRkGSZ8j3KDIod9rZu73k73JdlTNcmQE=;
        b=ekgzq+uvqESXU51UBoTfXJBXSOw0RSCiH2Pid9tYwvojrcJnTQjCf19RYuT+mta2xq
         6V4RhIM9wP95zohQ1iwiZYHOjBlysRabypfoChVI0N/9n2v9Fj5ANtynVnuhBVW3bSyD
         Jw8axGjOd/vSEMwm8TGeyns/Kf+sfqbWGIGnTZTNHuBzE0uL9nmmvqdv3Ap7M7vZeBs1
         PqGSSQ5r3tJJeQbFZQOLUxZOam3IP9yUwjmHyVyNvkQN4WjmD1Md9dDYmX10soQSDyPF
         FYkldGBDkU977wwNEfO49DCmixKDW0JINc89a4rwciGwrDKj7XLXE1DBd1oaOJ4Schno
         Lybw==
X-Forwarded-Encrypted: i=1; AJvYcCWtxa1CJfmNBqWxtQ/KfSP+CVcIlW0dpiCWW+x+oFff5FecI+S7h0hStdRuz6+pFJP5X+L9xzYXjZiKKME=@vger.kernel.org, AJvYcCXWXH/v2xjqcmlr15D8REsXPG2yswXywrETFBy+UKKxJ9vwSr7D5/2+0+XH8At43ZJFgzAdXEXssrlfHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnYN+1nOkfSh+HCQEwV5B+GlJ1vc/py+ZhxhNpf7qkk2G/EAv
	dXl1Iac8NPORLewCkhK1mcxa3rwU+mTxzlBzElavHgyWkIhJVPkk55BkVu4Ucf9Z/ulG524sPai
	8mr4L+nmdtZQBlzNhzHenUecniIq1HnA=
X-Gm-Gg: ASbGncviLZJmTkMQlQJHAF/ffcC/nZbAIEvgs7IzjJaFYOx/plg5M6bup/jsX3h9Cgd
	KfdIN6D+Fwnh8I+NMJjkCttG0/cg1Dg4ifueF7rxHZqVEjK/O5P5SDaOQj8lL28z0Y8rDx0O+/r
	NY4esAk5tr1qdhFPoz//y5SE0R6pZPzLHgmFhF7PgU+XVwvEqN9Tc0t7EK3uZIcudDvH+9Hkn7d
	00v1fKeI25qrR/S+pU=
X-Google-Smtp-Source: AGHT+IFQgW3rmTjF/vtqi9+MMjkTTfJ9Y+nzTxfsG4hJyz8gKj2KDnUQ6dMHedkp9vGRKnw1uLs+hbLAHVKpvQvEsJA=
X-Received: by 2002:a17:90b:5388:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-31c9e6e679cmr10698807a91.1.1753086239918; Mon, 21 Jul 2025
 01:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721143102.1ae3bef7@canb.auug.org.au>
In-Reply-To: <20250721143102.1ae3bef7@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 10:23:47 +0200
X-Gm-Features: Ac12FXxA6MH1754Lo5JbDD_HchnlFX-8GonkfMXnXYR_ZAlC_pMJyNhvZLuxkqU
Message-ID: <CANiq72mP6yJpqK=Gp1eBXfLfELC6EPh3-o02Hya6GUzuiXPO-Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 6:31=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel


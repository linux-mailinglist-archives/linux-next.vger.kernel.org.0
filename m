Return-Path: <linux-next+bounces-5796-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDFA62CA6
	for <lists+linux-next@lfdr.de>; Sat, 15 Mar 2025 13:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F053B6D5B
	for <lists+linux-next@lfdr.de>; Sat, 15 Mar 2025 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBF71DF969;
	Sat, 15 Mar 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0XYL6lX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F41D63C3;
	Sat, 15 Mar 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742041529; cv=none; b=ZTJgBBV2qeA8jBH14ONWbflKWeUVa8h5FNn2C8IDZuGAsCj3/8lZx+FZxgj+mC4oQ9y4Sk7tYOgBHZAvUlQCTwMGcwyaMrmEfkJWiqZzRGNIwr8Pdyd724JJzyOz/lnWrgW2o62IWuUXVX2t7dafX90fWTeCGdS/MjqwWNaFkok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742041529; c=relaxed/simple;
	bh=Fj+vIwF5HHqitIIswIKPOmK2iAZbwb8SLogFMsruDo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrZ64YXrEo/OdCR4FkX2g3WmGMmwTyqlCZRuOgXGywwIHmVlWOpnVUOAxXjlJyBoQ8v0FVpKnqOZQ40K5Yidftjf0NU6Cf5zOstHYNhAhX7mR0YNaA6vwnA9Z0BSz1eSUIcb2v6SaZw8QwvGre0AG5wquMALRY1ntqEz37D/z84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0XYL6lX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DFAC4CEE5;
	Sat, 15 Mar 2025 12:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742041529;
	bh=Fj+vIwF5HHqitIIswIKPOmK2iAZbwb8SLogFMsruDo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C0XYL6lXQDH4/TCGTRXfolGqDF/tPyEoAAHVzPXx1k5PVHxnLdcm+KAP3mlvEaERC
	 xxQo5p229Y5ZIx3hbssoxBeoCXYOMl5mCA5B/vZPxZBfdlH2gR1q4tOgF4yuo3LLJm
	 ljbSZKwrH6Nx6vdZET9Dv7KN+l3sPlCVxMl/fV+C80Zf/pIjxxdmO77EXLZOy+7yZB
	 V/fKRMW70DYyjAIU9ahEMtU6Zk7F5Aujjq7LpYFi+rkP1KPh4WNwfZmPmOI3ASgWz8
	 //ysT/PuoP8zYTZVic/KV2wdbL0FivWpPXfkUx+hDbt7MnosipBBfdB0O1cfscyJDP
	 jOXLlD8tDmv1Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499bd3084aso2978695e87.0;
        Sat, 15 Mar 2025 05:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1aKFR515KR8pZRMSySi11AYo/i/MSnICKR46VssTVVG5Vcff06HFuqZqVuWeR/o83n9gBZMEFn5N2@vger.kernel.org
X-Gm-Message-State: AOJu0YxOStk+vOu0XmA164K8eUlN04lYDI2pj9/7QSvURyd6JLUk1aNZ
	vutaniwQhdjyjB2XYd4yuf9KxxhIDy2cMg3HEsAjj9Ev748tpeckwLIs345tTv+Jc8vw3b+yiI5
	mG+bU4Ej7KEwBeRrVrj0L7NjW4TA=
X-Google-Smtp-Source: AGHT+IGgdR3X73Y5kOcNy46zEchZIi2iM+5xuE/oJRwNAGQE3cTkXDIYdJchk1GoSpma7micKyc6ZPJZk2D90ItZUMs=
X-Received: by 2002:ac2:4e04:0:b0:549:39d8:51ef with SMTP id
 2adb3069b0e04-549c38cf317mr1812164e87.6.1742041527689; Sat, 15 Mar 2025
 05:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313002650.135e6383@canb.auug.org.au>
In-Reply-To: <20250313002650.135e6383@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 21:24:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQWB__3BAfmJQYrXYsBa1D2=v355x12q4Rmoyro7LgiQw@mail.gmail.com>
X-Gm-Features: AQ5f1Jopy9Wed2bjnWGz573Ch-8ADcVE8ZxJIzxCdFZ9J0XXmY2XUCRrTT-om34
Message-ID: <CAK7LNAQWB__3BAfmJQYrXYsBa1D2=v355x12q4Rmoyro7LgiQw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 10:26=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Commits
>
>   bc5431693696 ("kbuild: exclude .rodata.(cst|str)* when building ranges"=
)
>   dafbec3f520b ("docs: kconfig: Mention IS_REACHABLE as way for optional =
dependency")
>   8ee44bd75bce ("scripts: make python shebangs specific about desired ver=
sion")
>   e6a2507c8d3c ("kbuild: rust: add rustc-min-version support function")
>   73d602eb38c3 ("gendwarfksyms: Add a separate pass to resolve FQNs")
>
> are missing a Signed-off-by from their committers.


Sorry, I made lots of mistakes.
Fixed now. Thanks.


--=20
Best Regards
Masahiro Yamada


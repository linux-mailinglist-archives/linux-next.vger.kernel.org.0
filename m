Return-Path: <linux-next+bounces-6342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE26A97AD9
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB7E18960C9
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 23:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA591EA7EB;
	Tue, 22 Apr 2025 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcgwvbrW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364C9476;
	Tue, 22 Apr 2025 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363045; cv=none; b=TdLGIVGYVruu/YV16e+DIcpIAl/1MlM0jrAlRPyy+NwXH0gXL3qXc+65ojdWlN+sNOcBdqwBwGENeFYGpI9dzexaWOO0QeCkBnbdUL43qbJagd0Diq0ErAOFDmVmrSYOEsO9BW8q1g9fIxcW1s8AEXhktW3f3uZRMumxGIiUmmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363045; c=relaxed/simple;
	bh=ajrKTQm0GGcx0nPQjO3KUF21eoET2g1lnumwxWay3aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dt1UWcQukgOtFqSHAo/gNyWlDmi3i3pGpBiFOQ4KFdJ8E/QwQ3LFraBCa2HKLK63S17BVQRuM1AzPuDEurjJn5kEG77vBZkI95CwWGDue76QXjWa6MofhB7lrTn3sA+flINpPSEmbf0inoC1hdpbe1+L43ghjH1V1mCwgoc0GwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcgwvbrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CA1C4CEEE;
	Tue, 22 Apr 2025 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745363045;
	bh=ajrKTQm0GGcx0nPQjO3KUF21eoET2g1lnumwxWay3aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XcgwvbrWiF3RmLzQQH+P2XE8zGA0wheJV8IhZ3QH0wGCbqfiCfmdPkI+T47MLL+Gx
	 MshKzhtyLMAb22gm4WCO7irV4ff1uRrfKcGI4y21es1+j7xLt+M8cG5AlRenk6DLJe
	 3gKE8FYa44vxtJj3Mvumthg3g/Zp0WhEbBETzrx0L9WN3ptEcLIEO+MHkaOCGoyYCO
	 s2bb25lRaa5GZ53HbO/H4Ma2d1Cv4GzQUAmzZAiEKB5ln6tgWouFvbPfg6FH544vZb
	 jZZb87tSI4TBP0YFSeuJJFYE49uCfYj3GDrEUS4bnMxTMYXbkXV1zKeaWGL0IESDd3
	 deOCjhP0Ywb9g==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so8847231a12.3;
        Tue, 22 Apr 2025 16:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN55UU7jl9pA3Hol/DCZ9O/4B4G2u2MPuYQUNfpr5EehXdbJFEAj/kPeAz/KxD/lXl43qADnXeRnL+ng==@vger.kernel.org, AJvYcCWrSInAPX+2AJXd/OqJdfPxopT3KUccZhzWlyjWvv8HX9a/kYjUp3QaKxCwvlKDkLnlYpXNAo7mtHGOkK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzOElQt2s7i0dkeGdgTg1HGD3cVz3GQlh59GKJc5L+K3wrgmD
	10gaWTKZMzYK/L4Ge0VIOunzLExzkZCYMm5zhQzi81NXo82/ArILU1C1EADDJLsB7UmiIoMW8ue
	jcmaSRzjgouX1X57ORnmAtT1cSQ==
X-Google-Smtp-Source: AGHT+IG8iAItvGBeJHp+yfN/w7entgLhKpZaRid2xMrpY/I7qMg/TmRlRRKQbm91vC1+LJ49h8jnueldQLVDyBWkuig=
X-Received: by 2002:a05:6402:84a:b0:5ee:497:89fc with SMTP id
 4fb4d7f45d1cf-5f6285ed6d6mr18619602a12.33.1745363043819; Tue, 22 Apr 2025
 16:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423084425.1fc9fb24@canb.auug.org.au>
In-Reply-To: <20250423084425.1fc9fb24@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Apr 2025 18:03:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_BaVH7FAqNHAt5pbwiBOx+woG+FV5azA1ftx54frSew@mail.gmail.com>
X-Gm-Features: ATxdqUHxSzftziCzSSOp7T20cv-pF-mYZ03ArDCTrXnqxJ399zZKTeUtBMzjQxE
Message-ID: <CAL_Jsq+_BaVH7FAqNHAt5pbwiBOx+woG+FV5azA1ftx54frSew@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liya Huang <1425075683@qq.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:44=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   8b176c1dcd6c ("of: Build warn for missing fn() in _OF_DECLARE")
>
> is missing a Signed-off-by from its author.
>
> The email linked to has a '---' in the middle :-(

As the original had the S-o-b, I've fixed it up.

Rob


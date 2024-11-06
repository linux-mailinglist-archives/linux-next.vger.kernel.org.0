Return-Path: <linux-next+bounces-4631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C29BDBCF
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 03:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970131F243BB
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 02:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA7618DF93;
	Wed,  6 Nov 2024 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMiQ4Bt9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757218C903;
	Wed,  6 Nov 2024 02:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858903; cv=none; b=XMUnnSjSuPE2QpUSSkAfbr4m2LD1YQ3GupzDlb/EuRZS/rVngRgzjUh3jS7iiePf2wTgF9NUUM11aqyVaTO1Y4sJnaxFiEmUc2q1L4dR0jnQLHExbR7bqFmAkOwXi1Jx4suROy+gRM3P8d8x3zWNiiGmJ91n5jvt80xvsEqR3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858903; c=relaxed/simple;
	bh=niT83f9VBSXRyo1igGF4oOOxDb2VMuMi+uFKkzFID4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlBYx7en/JLnTPeAFsQi1iOqoelfgUG7LF43BgXru1PfYpXGJNJJ23Fy1GfRr9cbzDRAOwS0gUM0JN7CLT04ypgGZol2nru4eeGgo4HdSPBtLCyaPEM/LEI/GAepJd775gD5jvQ155D84947+Q3Wo3Io2lrl1SuyrRn43I1VDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMiQ4Bt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74C7C4AF09;
	Wed,  6 Nov 2024 02:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730858902;
	bh=niT83f9VBSXRyo1igGF4oOOxDb2VMuMi+uFKkzFID4A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KMiQ4Bt9+ZYm5B3eT+G/Aprta+nBaKFBntEVbNrC9sm8+NzAK7feXPMk8WZP7Ggav
	 G7zjir5FVbioa+KcznzLYK4MY20Eb54JeFcJ60AdQEkEeobCa3Z7QWtWATp7d1PzsV
	 c8eAGFGyO1fLlvNb6Jhnv0sJjlTwflj3o4yexTpBj8loR6dguq64666oEVOnpl4962
	 0gzUXtsE/c1sdZz/qiU1GpKbOVj12RiBKa6TgvGjoi1NzsTKkStjeMfAhvfjLPuwGq
	 f6gU2CB4lLv4xocid6g7Pgerdrd/HuhH/S9TrdAZFhztgDu01z0eeQkmOWwaIyH9qG
	 wjLKFffwnGuPg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so54717521fa.1;
        Tue, 05 Nov 2024 18:08:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuSaHv7/1yYwEWzaVcj3iZ45U9r1EhjcEyvDjFZgYEvFaBNmckAdGXFhZvPHCT2j8c7ahugo0E913aloE=@vger.kernel.org, AJvYcCWSWc8JdfAy82E8NLPy7O/K/xGcWQzOQK5ZDKHM1RXps/ASTBmp4FK5bDLT23mBl3kYT6O4A+BI5lEHMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwU2wBGXxXCgoFWV8ZFsa9uRHmKI7rFZMqXJFaIDYosavyKv7
	6P4Se3tywi1iWdzmDuryeOMlCcpBkAWr+6tF9vYt2gRXkg3ixxFMXuj2pkexTo9HbBpIM5timCU
	vZQ1FuI+OInqWM9r/9v2NOWbfxEk=
X-Google-Smtp-Source: AGHT+IHjLCqQlu8B2w0LKG6mkmnlvkZSn1Ty2V+tZy5kmASjqbtG7i8oDm0rbUZqzBvkIFZ/juH1cLZtZ1LoaQGP9GY=
X-Received: by 2002:a05:651c:2112:b0:2fa:d604:e525 with SMTP id
 38308e7fff4ca-2fdecbf0a79mr94046261fa.28.1730858901160; Tue, 05 Nov 2024
 18:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106080014.7cba0b1f@canb.auug.org.au>
In-Reply-To: <20241106080014.7cba0b1f@canb.auug.org.au>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 6 Nov 2024 10:08:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v65kkVGhSqSg6wCVkWcWSY6ni0Qxe=HFMbBp2T+99UATBg@mail.gmail.com>
Message-ID: <CAGb2v65kkVGhSqSg6wCVkWcWSY6ni0Qxe=HFMbBp2T+99UATBg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 5:08=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Commit
>
>   bd4215c71992 ("ARM: dts: allwinner: Remove accidental suniv duplicates"=
)
>
> is missing a Signed-off-by from its author.
>
> It looks like the SOB address has been truncated at a comma.

Thanks for the notification. I definitely was not expecting this.
Looks like it got truncated by b4. I filed an issue [1] on GitHub for it.

I'll update the commit and manually put in the correct signed-off-by.


ChenYu

[1] https://github.com/mricon/b4/issues/52


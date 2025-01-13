Return-Path: <linux-next+bounces-5181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130FA0B534
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 12:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5A1A18875FE
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7D22F14B;
	Mon, 13 Jan 2025 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZt+LkuC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6DB1C1F00;
	Mon, 13 Jan 2025 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766840; cv=none; b=tSr9wCELpEw+vlR83kFpnhmX83urXm1ndYS5Y9RjjbEDveZo1u5KyrR2KMDaZicIyyY+2eKu3RQeLeKubBm1cGfnUvYJcK4JjHuPdYwflo3FqLly6Ptvah+7wLf4vCmDj4dpJDMsTrTfClkVHtm2G6LO4cOhzyohSK4ajISI9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766840; c=relaxed/simple;
	bh=fY+Yl3Rp/ZO9d1GJY8a4O0gGLQmnfxbbmFq9ymQbLYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7dCtA9ZsQzaZbFiCSYHWG4Ikts4kl92ExpACpsAnFekPgzthZdfb0o3GyYspAXS3KNqMAaZRkNxEfmcpDro/0JIfR2X6vBWyEMpPfhEqcVRfJZ4QLGYs4x1Ug41HD+LR/cp++xNtGiAR0YuOfJ704EKWjrShR4lZQGk4Q1wi8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZt+LkuC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f615e14d0fso398945a91.3;
        Mon, 13 Jan 2025 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736766838; x=1737371638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY+Yl3Rp/ZO9d1GJY8a4O0gGLQmnfxbbmFq9ymQbLYE=;
        b=YZt+LkuCn1gmRt2Yj27oxDuQBvNuiSkKgunAsEZ1Gl6CCi2DRuV83ULHr3A3/ayfwC
         5rQNa7Zbcr8I3LqRbIz+drCWPo1pvIUA/RDExJchLG6wVmG7s3HQBInC2mfsrRp+MTDr
         o5lEfnV1QHc7fAGRhBK+DoGcMaPspnUt0Vr62y7CyshMvQ9Zd2JO655wEi56TfDAB79/
         vKxG2+5JCPkf2zxiKj7Z/wEjqoF4qZhTlu1Gjd2rKwZRKHIgJ4yN1NW82mwEGlO+diBN
         XXN9ZAWiV1W+qct8QiOCNH4GRM7NIxaRfZhd1ISyaDT/z67CG5LgI3/IRTfB2RR3AGea
         pmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736766838; x=1737371638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY+Yl3Rp/ZO9d1GJY8a4O0gGLQmnfxbbmFq9ymQbLYE=;
        b=e79ZjYJqs1g1fbH+X9GHB0jKcuOOtu1eROaV0zNj8kmq6bkiCOf2RFkwK+rR7iSpMJ
         PoktZ4B2hP+i2nmRDJepKAUAibYG2caiwRlcn1qIPr+H5VMCWpvDQTD5DJq03n7C/8bB
         u0uvSExtohQLEq5MIwXJQwxvzY2x0GEkyNMeW4rhg7DSQwDfzE2AgtIt6zZRWETJk7O/
         zymk9908fka+91WyC7W05kBnm3+AvAy4nysL/1x8pCxBjjoglb0MrJCPQ8IEVNNfOBI9
         skcfK/sPEvZOGn8/wdPMInjz9Tf68sraKG8Vi/zWXWt8/hlo7G2a8GBk5fXhNiQiKf8S
         aTQg==
X-Forwarded-Encrypted: i=1; AJvYcCWi0QJ4V0s8dSTUCZdv4y6Lk7ldBhFFbJO9FeZ5g3bXhwMBIse6V5Fc5SRJTl+5013F86EyDC68+j+4lQ==@vger.kernel.org, AJvYcCXuaoLZo4eHot66JgLWzx3kCo+fATAuBi6Onb5s0w61RuCGo/qnGMzpNFn3DY4EugtqiTYp8pLZLFpJmT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9EM1ebrXQGLk6ALlUfBNvhSIE0h410X8GYzjwwrMZkZlerSqO
	eUdTXEDl6QYJ9L1HTZOVgxaFAAt+2K3FtL2X/OaLBqKGXHD32R4gB3H5DSDZ9NheyY3ZGuVVON3
	8/d/j44oAERrLz+6KoYZt1/AEDcI=
X-Gm-Gg: ASbGncunbDwKae0bkKBA6jop4zzkZntzwG4WEsVFJoXYHb5jEHoN/yhC6pwTqNU3/S3
	M8vGYz7Xp02GLPunampYwB/kpqG2XIyLGrIPA8g==
X-Google-Smtp-Source: AGHT+IGL4euAc7/VVXiABaShCfyElE0Sd2SFZ1X+3cDor++Pn3YzCaiF1SAtAWMBf/RP5KoGQ48bTUog3yPWC4tdK3M=
X-Received: by 2002:a17:90b:270d:b0:2ee:d4ed:13a7 with SMTP id
 98e67ed59e1d1-2f5490de540mr10790799a91.7.1736766837667; Mon, 13 Jan 2025
 03:13:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113151236.07378dd6@canb.auug.org.au>
In-Reply-To: <20250113151236.07378dd6@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 12:13:45 +0100
X-Gm-Features: AbW1kvboqeoZvrHQnJuV1ulDNDybJ32lHtJ2JamZW2BcloWcf70XY_4ccuiYDhY
Message-ID: <CANiq72mT+fuDZPYju-zkcXxacPSfMvC2HJSjazOfzfdep9wk4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 5:12=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel


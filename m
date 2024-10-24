Return-Path: <linux-next+bounces-4405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED389ADA60
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 05:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8E87B224C1
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 03:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66FA15ECD7;
	Thu, 24 Oct 2024 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYijpAUn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4D158DC5;
	Thu, 24 Oct 2024 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739933; cv=none; b=tYh45l+qBKK2PWuka/o2gw8Tq2y+A9f+Evftjt6GwkCo8bYG+qXpVclvroEcj146PRx0Ef1lL19SQH6Bs8y+O5oUVDbehlUafYnd2sApdfYx7DdChBPpqWIcEaB2xHstBdbfkYDi08n2DWxYfrRXJRevHC2aSllvoHrA2MMK2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739933; c=relaxed/simple;
	bh=xjGFZNstPrpQ4vgCCp6N/P6IszAehLSi+DkY8vHRawc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny9R6egIlaQNOJwmFBVMgV/gd2UNqwg4U7HOblbw5zBvE3+ptDr+4FZsaWG9KHqFRiHNUFm0EYFzvUeBnZvZMw2UN/13vfG9LeJVncz5b0NsbTdYcm3NX0MkkmWTZ5i45vCrlKDxnSX3OJdSAscKBdPdv7rRFdDSM8woYMbJfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYijpAUn; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb58980711so3265731fa.0;
        Wed, 23 Oct 2024 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729739930; x=1730344730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofDn4Of286XPlGie6siVpN/v1NCFuionb7yUorFjmQs=;
        b=YYijpAUnnV0FS7WAVHNNMbce7Fr51YTmcuhOPn3UkflxtdDW3whoEhfCNHF/IgJnhm
         ttG7L1kTstJ4k8Gdb8GtzONolSs4I9iJg1wjf2M2WRU2KzxZmjUGcqmPZlz0OsFOGBwl
         3LKd4tpCXA02mhhLrScF/osmDg4Bfx4zTSIZiCTKqblOeQFmjW1qN52+qjo1um2XMthu
         poQdZSI4ZSbF6yzq+XXYfPKQI3yuzNB2WEUTx0+oJ+ngGLHdLp2DaYtWIIDLD5k96YhC
         RW/Ul35U9SfbjN3JDCF0eIKmGF3R5YPzopxEFs7/xGib9esmNSQ87MSAvUB78oMhK3XU
         SNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729739930; x=1730344730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofDn4Of286XPlGie6siVpN/v1NCFuionb7yUorFjmQs=;
        b=OTkPfbbl9vydzObgla/OkMB5AAGKfPLCTjzS9iWutUhjgXRp1melblfvJX9HVhwcQS
         XbjqcCHUZB72ilA353l17oB8Y62d7E6VCYt3TaCRzeJxbNa6EWYviAVThuMyfAO75cPi
         unIFp3ZJBQPEeoYtA3ZQbRYyHVQ3xNin2G576Z9eVn1SLLH3yuDzhyKhfNlPV2j2JR+q
         UYKj9iH0qJADQebb3hy5JWrKSvHwI9kMBjLPk5R9a1OHOLKi1uGVoUVspRP4rAtdFIWQ
         PjaXiEyKLRShiyFLqQk4ZyB2p3ugwSSMXsKu8PzZ6W0ZTUeoL+DNbhlE+LKzg7E8HIq1
         doZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKw2OdIEZ3sb3xFIPfb03EYcL8dY3sR2btGXWNqFcJvJNgcdc1vOKpA8k9tp7Ie0dai+Oo0LDucuSlMMQ=@vger.kernel.org, AJvYcCVlTdryVq4UJ0yeynCyrLE8gjAb5aOdd8ZxiwbWGcar8+TDz0KOJJDFcH9qM0QSr4nHZehX6wXaosFjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AkS8UYjafIyLVlIam1N8tb3Fv8fVO/E4drWJna8rFMQ5c0Dc
	+Qy0/FmKXrYKwaMsS5+J1eSB6hD9SvzdhnBcScWtS6LtXUxgy+Q0xz+BXEHbA5yO2UoBUUiAnjA
	qdlVCVgrQgHEJUWtSHKwbLyJfPvU=
X-Google-Smtp-Source: AGHT+IEX+1b/1qcjFW/0DUOc4KkMr94zN2+ZQjl7RYPzJrE4XM3xToHzN+tw5xMivLTN45nAU+Qx+MGFglcbDnWAa3s=
X-Received: by 2002:a2e:d12:0:b0:2f3:f358:8657 with SMTP id
 38308e7fff4ca-2fca8283ca3mr1782771fa.44.1729739929535; Wed, 23 Oct 2024
 20:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022173921.6fdbdd38@canb.auug.org.au> <CALe3CaBU=9Ck-euohNna2hYxYJBbvA=LrmG7qDHTEeQ2rt9XCA@mail.gmail.com>
 <20241024092338.6a8f10c7@canb.auug.org.au>
In-Reply-To: <20241024092338.6a8f10c7@canb.auug.org.au>
From: Su Hua <suhua.tanke@gmail.com>
Date: Thu, 24 Oct 2024 11:18:13 +0800
Message-ID: <CALe3CaAH2w7fRwz4vnL_1fPWRNS6RDiD6izbZLpREXSuuw_mdg@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the memblock tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Stephen Rothwell <sfr@canb.auug.org.au> =E4=BA=8E2024=E5=B9=B410=E6=9C=88=
24=E6=97=A5=E5=91=A8=E5=9B=9B 06:23=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > On Wed, 23 Oct 2024 11:20:43 +0800 Su Hua <suhua.tanke@gmail.com> wrote=
:
> > >
> > > Thanks, I'd also like to set up the environment for testing; could yo=
u
> > > please share the command line instructions or XML files used for
> > > testing?
> >
> > Sorry for the delay.  I run the following qemu command line:
> >
> > qemu-system-ppc64 -M pseries -m 2G -vga none -nographic -kernel $vmlinu=
x -initrd $initrd
> >
> > where $vmlinux is the result of a PowerPC pseries_le_defconfig build
> > and $initrd is just sufficient to get into user mode and then shutdown
> > again.  This latter is not really relevant here since we don't get to
> > user mode.

Received, thank you.

Sincerely yours,
Su


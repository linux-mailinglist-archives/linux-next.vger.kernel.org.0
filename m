Return-Path: <linux-next+bounces-4672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D322F9C0845
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69864B21657
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCEE212634;
	Thu,  7 Nov 2024 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr7GaOMa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794D1EF0A2
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987980; cv=none; b=I4EC8HNHHjhbgzeNGWS+H3LadNSc6qEZil1USRhKhK2PsaR8E/c6zPzWUzkQaddepfF17yjiBIASB6GQp/AjjFteWiNDI4yBtOCq6XVBWwlxUFHGQ22wcPHn0yu6l11WhvXfVJYpv+oSP1SHBBeLxqAAJ6eqGigWhvqkwCebEFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987980; c=relaxed/simple;
	bh=OQLnOEmBaDmsBPtFGs6fvs1NVt7tHuk9MBrY4dFLnhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDfvozldMwtG+UVI/ylhwN/R3A/BU8/F6gpgq/2kslcYXJFZKbfqGKugEKmJdURLsy++N8z31zgPFd0ESZlT9SOzbFFqCL1XbLiQGN3eZjaPo63yg0bmYAIcjy5HExONKUl1D8uaKOh7Ytwq6ZE/9J1OQbo9tlPUtoCp1FcPadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr7GaOMa; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so10509061fa.2
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2024 05:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987976; x=1731592776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjPqhF+YlcQn0yIhmNKRs/DhEwJmEmeP8iLWLpMI6mA=;
        b=Wr7GaOMaAYAJ1NumEbw4IY7fXVLdY6k3FRbDryNGPudP+GFe6PH574ZUEP3F1J3ET5
         qvdNxZKWV1vPjWDEjCW2qBHJNzZY2volY6RpZ7bMlGDyYFeZPp24OyzEy+O/MxdGhLBQ
         OT51vFSysuK8aSYMnClXWh7Hs/5OASk4VQW8TMgP9hwuGhwocAoxV8Pn+VY8JvqOa9l8
         kjyCK/CuoDd5sRu+qE2hGqC0LXFYfnF9feBH22Khq3cuuw57OlawB4wKzyYMtIsN5NlB
         TFXjKGQV4e8pErGMrdAuqCjzlID5ZyQDJg5NeJ80/ZzFmEt50p620pPNUpjuzOOvceen
         8xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987976; x=1731592776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjPqhF+YlcQn0yIhmNKRs/DhEwJmEmeP8iLWLpMI6mA=;
        b=Fx5M/LWL+pRKDkE4/i+AC6r2aqtbD/VzuRYfRKFWmABZ53MT4t4zzYgQiHnqK4W6QU
         eLCjP9b6UZkeYeuErGdzYb6ua3oYWMAXwTDQIH+as/7b32ujnteF88wbOetWjuTqe7Bl
         uG8mHx/vdIMjCa9XFJCTuXmuzFbPi4UPIFapYoPxHtdUSFw9q2KMVvgSBn0rAUDwAh6n
         6U5fDA0xfEBU7QzzF8K528bkkHo3jrnlE4qhXha2LcuGhCAvUznXkpkUgtVXK/t2yR8T
         dKEYvRqWCeNEXG3EtijHyai3cPlShZ+tyBOjeVTyiB8zRm9mS3G6MezGoXzNjYuM+/CB
         yqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ajkdDVheXQplX5okydj1m2ycrDFKllNU/NRT3QsE0oufWm25ao+VuvVkewhkpBdPAAgXkzat/YBk@vger.kernel.org
X-Gm-Message-State: AOJu0YzPR8DpOAwFggwT1G6VHxe7JKGZzW7pT1/yxy00W5af6yZIDGSw
	rwYLW1oOnBOmL00dCl1IXAGRcO+y3L+y3AsMp55xr/shSJ5sM8DW74mrYR5Gp5bBAmeOBjfg1ji
	YoxMLNMG9lghfjoQCXvx8l7TtqS2J/xp8hMMQmA==
X-Google-Smtp-Source: AGHT+IEOhHmLmRUqDNgrDsObWsI4Bps1lbW63qufnLX/1tK5ugJfjlWHaCi62d8USJPOFp5KNIZcOECyI4iQH4ffxXg=
X-Received: by 2002:a05:651c:507:b0:2fc:a347:6d90 with SMTP id
 38308e7fff4ca-2fcbdfe2dcbmr202626861fa.27.1730987976405; Thu, 07 Nov 2024
 05:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107214351.59b251f1@canb.auug.org.au>
In-Reply-To: <20241107214351.59b251f1@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:59:25 +0100
Message-ID: <CACRpkdaxB1APxK_rRFEhcwBw0JZc20YN0z_881_iYVxeKs95LQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the net-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, 
	Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:43=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:

> Today's linux-next merge of the pinctrl tree got a conflict in:
>
>   MAINTAINERS

Thanks Stephen, looks trivial enough but will try to remember to mention
this to Torvalds.

Yours,
Linus Walleij


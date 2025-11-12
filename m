Return-Path: <linux-next+bounces-8939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B58C51CBB
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16501883311
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CDC304969;
	Wed, 12 Nov 2025 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO6dYcU0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02F3064A7
	for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945061; cv=none; b=mzrLOApsBeMOvEBmSnmXGP3OPyWtd0NGZUOkSzO9WWHl3w3NXqZxod4HZypgFW5vx/ciTHBis6br3CrOS6UbvY9wn0xgPGxd0NrpnbwDJdXqyQeZCFNDPdtDURfXODdSqrYP+s3ykZLOqdcHx787AiwsRMrKqMFmQ5hVoCIf9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945061; c=relaxed/simple;
	bh=1+1ng9aJ9EJ0nUlXg0Otdm00yBxHt6dChlosv2yBOQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eq/LdJu2YzItkveKIsO8tYPf1oTQ3nKkTHfr9YqJ62OOzZBz+nmCVQ7WR9xnG+JorF7mZiwgUOXfm0ysbliKz8e5x70QWMVfJudK3p62UWJtDFdo/2mJ6/S3RK7FqGOd1TRoOYv9rDm0oZswAc3x+IEHr4bePIwb1WfJb3X8mEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IO6dYcU0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so971121a12.0
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 02:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762945058; x=1763549858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+1ng9aJ9EJ0nUlXg0Otdm00yBxHt6dChlosv2yBOQs=;
        b=IO6dYcU0TzYZ26d6FwY3YLq5o28pQcJ0PdkW0O4qUNOtnkXSXrK9RJlS1urH5Guor0
         jA6JbefoH6Ql04+TmrJ02vUCnSZrXZNb2ldmkIOaW+ALjlVZWgNdJrMjRhw2IiOwoVsL
         e80k4qeLl9CG4Z40qc0ilDg5/z0CQWJvr1nGZqL8E5go/bpvedZjvY/AmwiZRb043W6a
         sETOx8e3MlmHFq2AJwyboShMI6xvPOP0DAVIMA1XWvugiEV3O2StnXVQO/034v6rknoB
         fmqLvDEdPiDmlYgTC1vyeiZFADb/dfULRuNtnxP3Nvb5A1kG/pU4c2dIb7HhA9Mi3f8o
         PItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945058; x=1763549858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1+1ng9aJ9EJ0nUlXg0Otdm00yBxHt6dChlosv2yBOQs=;
        b=pugHH7f3al1wG0xRbn9jBGT6c5xiUzLY1HlSZXwU5+pALTcAGr/NKoqAiXlLxCujwz
         WcZe6AU433adA840d5ZCLtWKc6i2xsan/QT8vq00aYeEo1dHb9Is5MGHCd/k0fFy0HnP
         o8agmNh4XWzpyVv7TLWBbt8zWRfCXiHBDq8royeFQdo/lHRxd6na+1eksPzn17H5fQk1
         tMurE86ZjHgEAb8e/JPQCFT3iRa5GPVDA1twcJpaWg7mD4nRot5UH3MZTyVhzOnWzWw7
         W2GccgnX1ci2ruc78Xexzj76d+nMkVTODho6a7GJfhngk4cLwd6vzsE1a0GrWgQ4Tr3j
         Y6NA==
X-Forwarded-Encrypted: i=1; AJvYcCXdCONZhB6OGCemZClX+iomfIjCopIEAcmLHrVgLDUwDRTQGER60dy5FW2i5NSK1efwV9cOHB0EHqc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyum334kSZU9KgBWftLpAjJz33hgDaGFp3AB6W/zGtUJ72iRPnk
	zduZMi9QgGl4u9psuGsKlbUisGZ1zn7WNrWj176Ohr0KzJ/hD3XDFe1+sWGDLmpmoM2JU2s2R94
	reB9m5zPCHnF7xugPYZ8b58seLTPjTOMCRg==
X-Gm-Gg: ASbGncuN//hbryeVHAnqJdP7ep4hLRZqSKs7zvEN09Lu2NHXySFzU1Q0OnZc4yCf/uj
	n7MM3xAV1l61T3zIqgqyVGzeDQY74FrgWvWOgmwtGrnFLYWgexhbtKXYf1/ZBnhZVgA6x83E7wT
	lR782uTprcqRri433DkYV4Dok/vTrEl1fSzgsAGB7Q7KRgkOXB45hiFZVweLrdEoFAYaO8+IbNE
	hqoOVJpacUzvpkpq6k63NnCwcK7Adk8vvHqkFQ+6IJtqBMD+Z53a0m4aHKCX3jQ+Sua4j7uuukd
	+UwW8es23gpHThE=
X-Google-Smtp-Source: AGHT+IEd0OopFwNqDKITCHZRG3zA6oImuGq0GUgA/NlByAetznsmlAHRh+tUnZYNKmWCBWXTd1sFR762HynSLp6z2Ds=
X-Received: by 2002:a05:6402:50c8:b0:643:130c:eb0 with SMTP id
 4fb4d7f45d1cf-6431a394a25mr2279251a12.8.1762945057712; Wed, 12 Nov 2025
 02:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112134242.2608a613@canb.auug.org.au> <CAGudoHEa=4HueuL8Ypfd5VNVyo5fEsfeY2+6c3nA2mvhXNt5Kw@mail.gmail.com>
 <20251112215541.049f3ba8@canb.auug.org.au>
In-Reply-To: <20251112215541.049f3ba8@canb.auug.org.au>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 12 Nov 2025 11:57:25 +0100
X-Gm-Features: AWmQ_bknuHbDIx5VcJNHzglHWhytOudi-By-Y0hGcyWxNQSnMWdaMS6k6dtQGw8
Message-ID: <CAGudoHE-3MNRSCMX0tf-t-Exopvw4n5M8b2SFZcbbiM7is-gkw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:55=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi Mateusz,
>
> On Wed, 12 Nov 2025 11:10:59 +0100 Mateusz Guzik <mjguzik@gmail.com> wrot=
e:
> >
> > That func is a little special and I would argue it should not have
> > these documented. Is there a way to exempt it?
>
> Since the function is declared static, it doesn't really need
> kernel-doc, so you should start the comment with "/*" instead of "/**".
>

Perfect, thanks.

It is Christian's call though.


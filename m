Return-Path: <linux-next+bounces-4750-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6B9C4A50
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 01:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141B41F20587
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 00:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9521BD9DC;
	Mon, 11 Nov 2024 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDilCsJB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736951AA1E1;
	Mon, 11 Nov 2024 23:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731369542; cv=none; b=BWGsjZdyhV3D0gznzozwXwqYK7xugIWeIVIFqgibgqdJ2gP3DYZ/O4ZVePUgRqPU5M31wGKl21vY7MuK/CeHWc14S7Z1ZwLtRjrjNlilbGvLdc+3/M7QmUM/vciyWQIlyFFmsENh3nP8lPB1zRC2RR5LUtsuc8ljMvyZ7cLg0/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731369542; c=relaxed/simple;
	bh=g5h/h9PWHLoMiRJYGa+P+P2CWUthedtGOAQDIf1+ros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIJEiUIjvJ3U/EB0lqKJEZTiG1lUWNua3aSpjWnZVhWickKNs0KcjCsLAryUkNm4tAVJlN743PO6/15E7pTm9aOdJJsUTYrn0Rq58g1bYfV/0h0OyfOwgzU7S/i5RSptaEvQd5GsKgFMOG5+mPNOukaLRDsW4es3YexcPyZmF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDilCsJB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so18027a91.0;
        Mon, 11 Nov 2024 15:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731369541; x=1731974341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5h/h9PWHLoMiRJYGa+P+P2CWUthedtGOAQDIf1+ros=;
        b=gDilCsJBSe5kh3GjJjfXz/XxCCKY+/MneSia0PbQ3CnEH0QXDSS2faRigOfpfjm9g0
         PSEcxTN6g/D91Y6w6bEtnJGdsecPLKf4HihZi9N7Nm7zAbGVXT8S648vybGyqS8CNnlh
         2VmlsIoAyAIWFVhNwfN0IEFwHF5H0efOgJq367zZq2iVbWhxoTalEThsHUunxx+BTgJq
         X9JE0aepnKxYEX8tYgjINKDYiMW7ZAKLi526slO0CCu1T2qTXEaOzmrew0eaQoT8lTFQ
         Rc3l0C5yrEEq8dWVO2rT2SqvPYplDbvUmmpgNCBk4qMgb9R5cem2f1tiyspAoGpYtAvA
         pZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731369541; x=1731974341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5h/h9PWHLoMiRJYGa+P+P2CWUthedtGOAQDIf1+ros=;
        b=O8aQUUcdfjhgtaLfFtY1IwunN2YCmUzNeb0p/K+eVloMVby1XKdVgL+rd3Fh6S8emU
         fB80PBOuoZMu3cF8CV46685ylocxfroA5ZD1jfY/oVOFYexw/S7WM01/JXb7ahEdvDsj
         4t82h4CgG9gYwt/S8HIyfIIT8DFKqbs8dX+PE7jDx01XmYS9BhB8JMCsrAG9LKndmM3t
         TzsBhavbFq8ujEZog2s9zLqwJ8tbk6HMOFnj7XJj4QBka1DrSnA1G6OYZQC0Djr3HIs2
         T3ZHh2d7lj/aABL/zp2640htQYz/G+G5dP3P6oJlH36GSsSg9K0ic0G9nbkknBIheGRi
         plZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVVLHJL5kO3LeqSfLaRJhA1hSXUTaW5Pf0Wgu9NORov8ZmmWCfo+P+r8n+VMEa0uwSJgMmn065T3gYGQI=@vger.kernel.org, AJvYcCVd2AhDnKS8VigPqncYbEdFI8QBW/oTQ7D0+6ZLsa8RfvikektG/nNV8H5zsOo7EjE/8xddibdh1GveTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfBYYjMAdfJjcf5DWScx3xfGkgQDvDsTf1wvyMW1YJFS4u2sB
	uRl2P8YEcin5iTHabx8zSXD3oBRQajSglgfd+pfVayGRzUXU75usDUMHuH4z7fiZjzBQjCaqYW+
	QJ7/gC7k8FKopkxoDvNoeyrXLDR4=
X-Google-Smtp-Source: AGHT+IHqvFXwAc9aQOjFPVI665c95LzrqmfF0gdQoVYnevk24YSeJ0FO92Edk37o4FzCa0ZfGjxtXTjfeJaqu+K1R80=
X-Received: by 2002:a17:90b:3b87:b0:2e9:4a0c:252f with SMTP id
 98e67ed59e1d1-2e9b167f7edmr8066692a91.1.1731369540839; Mon, 11 Nov 2024
 15:59:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111175842.550fc29d@canb.auug.org.au> <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
 <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
In-Reply-To: <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 00:58:47 +0100
Message-ID: <CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 9:28=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> remapping", i.e. taking the commit as-is without the next commit,
> since we should be able to do most of the renames already.

Stephen: I went with this, since unless I did something wrong, you
should see those build failures are gone, i.e. your build resolutions
were fine.

The hashes didn't change, I just dropped the top two commits.

You should be able to reuse the resolutions from yesterday.

If needed, we may simplify further, but let's see if this way works.

Thanks!

Cheers,
Miguel


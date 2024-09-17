Return-Path: <linux-next+bounces-3898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A776C97B5F2
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 00:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD611C210F7
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 22:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F8B15C144;
	Tue, 17 Sep 2024 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhRKzGlw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF3208D0;
	Tue, 17 Sep 2024 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726613718; cv=none; b=Mw9bt/e5JRXk1kCQvoF4xn5A7fEYSIRmmpNsZiL9gei9LWkQzpSfURY/IVw3SExOAfp/EAAGWpMJ4xeyOWmVMnMDdsnHJ7uqGV+RnpaGCDd1EzWE/mNhY3jhUQNSbYbZNjYBvpwH028UXTW/xsa2iEzqxHJo7u+gVQt0uh9B/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726613718; c=relaxed/simple;
	bh=7pt6/NdSRGsKCr7dAnEZxjHuCV8vZIOSmOLJzsCOY7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msVT9uPGNbS9s+54A8fkpcOkpDHy3QwpuKNVdd9d9ZFlq/5SnacQAM7uLaqb4q58hsHjQqTPLJyaaMW5nJ+d2qpZ8soviPDHn9ehKcx5Fq9xbLf0Lu3aQW+GnfmEO6m+pqwcH6O/towikBhndGoD5c3LiRsUPjoV56R16LfGagM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhRKzGlw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5795C4CECF;
	Tue, 17 Sep 2024 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726613717;
	bh=7pt6/NdSRGsKCr7dAnEZxjHuCV8vZIOSmOLJzsCOY7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FhRKzGlwjDpaBgXDm71+ykMIHI4DTaBaDBXjsQxk1noVJawgI0gXbqqaEdEv76Vdg
	 n3wdHe/uSL/hHieKCgOt4Fq7RXGdvJ32As2v3ng1HRxFYCCEn3hmQEpO+8TZ2otDl3
	 qkeX5mRVokQ95zlGsE3bZiB9qlEqSKCD/kkGZ3rlyYGikSCd+6jHb3pRWCzv4Jv0TO
	 aIRbb+5MQBwiapcE8wmNotJJVVRnEBaPzwq+QFXd2Va9dhQLCnL9QOYmTXMef4KwAg
	 2fp5yLZDZANrU3rYKOZ0JGUhK/IBgGsnGlODMatJ+61qsqEYA/1p2CTtIBZ8W9qcLv
	 bj2q3twBDGeWw==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2780827dbafso2556471fac.1;
        Tue, 17 Sep 2024 15:55:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgTrBnJhRjr/A5lrNg1spwVZKRVNhU7ZVB+ZK+ROnz7ByVOVUkxB8JG4Rpfky3yZHk21SqkkOmEy8EDQ==@vger.kernel.org, AJvYcCXiraCVqXuVWjgjXsykWd0p4gc8DJ6mlE2d38li53sJtCzGgvcBs+4UFbIbEKQe4s5AOQ4+/UdSuiiV9bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxms03PEcqHz2/5m4PZtt8lxdoqPmj6Oomq63BIoHpyVuLrecGO
	z/IOB7GFLoO5vfsLq+FYgNKzK1QwUiIap9y/bzaTl2stbZVLyavpn2uQ/nmxckGkiMkZXCj8SZs
	nb8eccERj/zMqtwGFIIOQ6JOqSW8=
X-Google-Smtp-Source: AGHT+IFrzoKN8gE/bX0LOpzi2sP7RLQGw/8k8Ds/ZCwYSF7gDyW9eGDz+uiP7W1kAB41Pk0SAxinlPKP1lmMuYhTQBA=
X-Received: by 2002:a05:687c:2b8e:b0:260:eb3a:1b2 with SMTP id
 586e51a60fabf-27c688c0633mr9973789fac.7.1726613716925; Tue, 17 Sep 2024
 15:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918081323.760ac7b4@canb.auug.org.au>
In-Reply-To: <20240918081323.760ac7b4@canb.auug.org.au>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Sep 2024 07:55:05 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_=u0qqtuQNwx7y10U4sYVFzk-A=zO-eaeMNJr3KFv9Kw@mail.gmail.com>
Message-ID: <CAKYAXd_=u0qqtuQNwx7y10U4sYVFzk-A=zO-eaeMNJr3KFv9Kw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the exfat tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dongliang Cui <dongliang.cui@unisoc.com>, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 7:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the exfat tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from fs/exfat/inode.c:18:
> fs/exfat/exfat_fs.h:13:10: fatal error: uapi/linux/exfat.h: No such file =
or directory
>    13 | #include <uapi/linux/exfat.h>
>       |          ^~~~~~~~~~~~~~~~~~~~
Oops, Sorry for missing adding this header...
I have updated exfat tree again. Please check it.
Thanks!
>
> Caused by commit
>
>   0636fd914f77 ("exfat: Implement sops->shutdown and ioctl")
>
> I have used the exfat tree from next-20240917 for today.
>
> --
> Cheers,
> Stephen Rothwell


Return-Path: <linux-next+bounces-158-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA77FFA0C
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 19:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC043B20E94
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AD54A9B6;
	Thu, 30 Nov 2023 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnfCa0q2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE7110D1;
	Thu, 30 Nov 2023 10:52:08 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b389399dfdso37498039f.2;
        Thu, 30 Nov 2023 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701370328; x=1701975128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSUQmBAKYkYrpY41v43m0knZKLfy9bpen4/P40ry7dE=;
        b=MnfCa0q2URoT63xW+mRU/MldxGbXyUuanTkmaqBLVEbEzajx5orhFX6dd2fXkpHIor
         ILn0I9c/goeCY2C/czawZOREjJ5c8+YbCj9Q84UAbU43p+3OgHYKcMk0VIeivUhFLw3+
         2lPUmJiYUN8RKpDo1GAKI7SSnkylJ9WcegnUXy/Crh2UZ81Npm58aBE0qze8FKClGYdk
         BRc/X8xJFor63ql7t8HlHDDKmTEbZgNrfPmkCniPj8uO/Z9sb1tTJwF6Zm2vV4OEPt4H
         Q7NyeG5eZJlWcBXX9wng2aNOaOPCBhCPv1osdi5YIy9LRkPHnGZmJ6ZHP4Ie1IALbisL
         7tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701370328; x=1701975128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSUQmBAKYkYrpY41v43m0knZKLfy9bpen4/P40ry7dE=;
        b=bNg+UC56x4nSwC4ZSnzHQYqyQWazlxmmfaiMQhMfVUE0N7UYmETRhH0242aUnwdnNf
         CThyiWZyFsXbjhIzW1XmxijZuQo19u8qGl1Y9n5IAh1INa1vis1wRyebdhUCp2x9UHJE
         WPOLqph37WNgJ1I20udFdLjnjdjL5wBJGdRIx6otR/4smzbS6eXuztMBFwUx1YSuWXJs
         rvfD0zf2p+4hvO4XAMw/GeP/MqH01IMjEq/so9mENiz2+07S4QvGtihM2zpxDzbS9hTh
         53zCZN3OU+4rws0IN+KCrYOPvA+tT05cBQ00J2rRvYB8XzVjCcHsn5dtfP6lqebCkVk1
         rKJw==
X-Gm-Message-State: AOJu0YxkzrCk1PfjpKsSWy5yzg6FugH84iRaVo1Rk0Id7aIOR5cmxuVw
	p7+j7UGs50csC/wPReH9INXX4X2cwHBvEtEzlkLbSBJBiCc=
X-Google-Smtp-Source: AGHT+IHdY7uRSa5FbKE1+o5t0MbSvVmvWeWXAbHlj9Kja92DH83XBgWsFJHnINTkBtG+zPcV9sk2y+mXAN4McTt2R1o=
X-Received: by 2002:a05:6602:6411:b0:7a9:a31e:c05d with SMTP id
 gn17-20020a056602641100b007a9a31ec05dmr25196017iob.18.1701370327949; Thu, 30
 Nov 2023 10:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130140330.55de96cd@canb.auug.org.au> <6d11b95a-c5a5-47ca-b3da-d78f2ef9f5bc@infradead.org>
In-Reply-To: <6d11b95a-c5a5-47ca-b3da-d78f2ef9f5bc@infradead.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 30 Nov 2023 10:51:56 -0800
Message-ID: <CAKEwX=NCzMQzJxOTOsOZzGe4TeC6hzEUaw1HGHQLCc2bBTisNg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 30 (mm/zswap.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, 
	Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 9:16=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 11/29/23 19:03, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20231129:
> >
>
> on i386, loongarch, ppc64, riscv32:
> when CONFIG_MEMCG is not set.
>
>
> ../mm/zswap.c: In function 'mem_cgroup_from_entry':
> ../mm/zswap.c:313:31: error: implicit declaration of function 'obj_cgroup=
_memcg'; did you mean 'obj_cgroup_put'? [-Werror=3Dimplicit-function-declar=
ation]
>   313 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NU=
LL;
>       |                               ^~~~~~~~~~~~~~~~
>       |                               obj_cgroup_put
> ../mm/zswap.c:313:62: warning: pointer/integer type mismatch in condition=
al expression
>   313 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NU=
LL;
>       |                                                              ^
> ../mm/zswap.c: In function 'shrink_worker':
> ../mm/zswap.c:984:31: error: invalid use of undefined type 'struct mem_cg=
roup'
>   984 |                 css_get(&memcg->css);
>       |                               ^~
>
>
>
> --
> ~Randy
>

Thanks for the report, Randy! I'm fixing this for the !CONFIG_MEMCG
case. A new version of this patch series should be sent out in a short
while.


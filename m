Return-Path: <linux-next+bounces-9551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE5CF6707
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 03:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AD1430141EC
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 02:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478026CE0A;
	Tue,  6 Jan 2026 02:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVIMXYqk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FF247295
	for <linux-next@vger.kernel.org>; Tue,  6 Jan 2026 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665751; cv=none; b=RIYkK86O30UD/C89upnKb38z+phU0Xzk7RNaQH2wQcdfMc1+AKRoFRCwcRpy+fweehZyI8HMnPzskBgYN85p1LdQlA/8JXXGCGgh2Y9HPMCFtfUJfp9wHt4x9yrrdztCMEF3NEnuFhXF9eWYESb8MuDeaI8WWOsu20G9wYBADcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665751; c=relaxed/simple;
	bh=CsMhaJvutyGAYswigpsd3Er9zcC3D6NC3P6YF/TW7k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLP0vYq3xV7kIl01bjsHLooEDYnHbMXz1zQvUME7b3j/M6Y7mAk3O0GaYRd3/foHNEawswYtpVx6tCM0kdHmeDb+lAlvbugdCBEG5i88DlfLeuXGm3qudYuiQDQYgD1V63ynhdklqkDLo0KUXCkNClG6HRxa24/j3pHq/L0twbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVIMXYqk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so299663f8f.3
        for <linux-next@vger.kernel.org>; Mon, 05 Jan 2026 18:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767665747; x=1768270547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDhzKCEhlnuieuWzeq5yiYuir1bwBk2FS7bsiPbikHA=;
        b=HVIMXYqkf7wUYYvK4IrWj3nTJS4+EhDJBX+pDqLFivdKdHKolfJDK4SQ8kaJhllG/E
         JAafSVyEhgfTadeKabm771v8YbS7SHJSgU6x74nz5FHtG/ccfeNX1Zrus8Zxs5iNW3iM
         3Z6ldnNbqRDJWlx4Ho0T0AzSShcmf9oOvCcOClF+JYFaKWnu9r+1pMPIgh34jADO4t7g
         9t5suaumlpoHRxupBKLG6gWWhADKMQpDuU4mas50z/agN6k0GxdlCFPz20Htj97FUv4P
         8mVmutWpqrwPxryDosd+T6jEsn61q1H5amYvKmpPhvGvzGQMiy0fLEkwLWUXwimNF0Nh
         eqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767665747; x=1768270547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDhzKCEhlnuieuWzeq5yiYuir1bwBk2FS7bsiPbikHA=;
        b=OY3BJCW/gLevuB3VPknfsTEBMwqsuwZIs8h4eZCzm0l+SV7L6ralL4jKu3AsLK4iER
         X3du+tYnsBGCxDM4VJdvwIm1Z32TN0vMKuD+fKZADQvPHpmoZYnifSR4qkpl4wpR92eE
         QrL6gSxPp+tqbMYay+b3RrWhKaVOAncpB77qoKLifW9LSWPGy0XcLRz+ciF7/8dOnWaG
         UjYqQRBtLJ3aQ4B1l/up35SVCEw1QouHK+TrICPbolOSD07JgFtf+966Gw5ORC50+XV7
         LoaEU6tIlnl+c29UvnGcT4Mp/Kgu+mtQDLT9Z2vaNS9a6E0VwGybH/heaveAPdkLJG4I
         Mt4w==
X-Forwarded-Encrypted: i=1; AJvYcCWI0sshl2WP4p/uayDDgwZcoW1lCgpbDNiHGUQHTlSATDW5Xlw8YmMsW72oCDaP6WUTTAwfqka4wIln@vger.kernel.org
X-Gm-Message-State: AOJu0YwCFvbohjuOgjmJMqI2qPfNz+hW5AR14MOehUJQMEuT1kdKiQkA
	3F1fSk6GHkJyEwz1vsQTB8uVkKId2aDnqLzJoSMl9ZKX9uFtIcdPC/95Z/nojoRrbC2wWlBhSBY
	e1Utg3Fv4VGMVgN7PHnz3yYJcq+HEPAM=
X-Gm-Gg: AY/fxX67N9+VbLsfQ02lRmr3sCOpR0+568p/vR6ao6cb++qgkid/3tw1u+pibPMUU/e
	2YmuFNN7fuP6LoUS3lcpJF+SeZExyrWMwzDV+XZNoY24+VZH9wRcHp9kiI2crSz8Z4xgwKGdwIp
	bQ0ariv/a6eQpTDIqW8D8s17yXM5j9PPrhyiMmJKZY8WFgLnfJ7Ufs2yT0E3l2byMIMktclBfld
	VEzMja8PjOV6IAwNB1XcXRxocnkDM6i9gSoVOK8rmBXSxAoFgp4XlxZMeFjdBld9YgCLh869+Dd
	iOc3+thVo2COk48qLdOaTB9l4r5v
X-Google-Smtp-Source: AGHT+IH7ZluxX2wfvT3xpq91hTg7MZMEYPiM0ad6034ERy8mDJruijzlFcdACHHyo4XoPbd80qA+JjQttmgrpCIv3rU=
X-Received: by 2002:a05:6000:2891:b0:430:f6bc:2f8b with SMTP id
 ffacd0b85a97d-432bc9fc52amr2436368f8f.45.1767665747073; Mon, 05 Jan 2026
 18:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105130413.273ee0ee@canb.auug.org.au>
In-Reply-To: <20260105130413.273ee0ee@canb.auug.org.au>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 5 Jan 2026 18:15:36 -0800
X-Gm-Features: AQt7F2qLl3PtXa1b7Azrz9jEfO1E_QU1sCOfMhqpYy96XLMMFtYZeuNavxCi0x4
Message-ID: <CAADnVQKkphWpwKE17bGQao36dH8xqCyV-iXDcagrO7s-VOPE-w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the
 mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Chen Ridong <chenridong@huawei.com>, 
	JP Kobryn <inwardvessel@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 6:04=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a semantic conflict in:
>
>   include/linux/memcontrol.h
>   mm/memcontrol-v1.c
>   mm/memcontrol.c
>
> between commit:
>
>   eb557e10dcac ("memcg: move mem_cgroup_usage memcontrol-v1.c")
>
> from the mm-unstable tree and commit:
>
>   99430ab8b804 ("mm: introduce BPF kfuncs to access memcg statistics and =
events")
>
> from the bpf-next tree producing this build failure:
>
> mm/memcontrol-v1.c:430:22: error: static declaration of 'mem_cgroup_usage=
' follows non-static declaration
>   430 | static unsigned long mem_cgroup_usage(struct mem_cgroup *memcg, b=
ool swap)
>       |                      ^~~~~~~~~~~~~~~~
> In file included from mm/memcontrol-v1.c:3:
> include/linux/memcontrol.h:953:15: note: previous declaration of 'mem_cgr=
oup_usage' with type 'long unsigned int(struct mem_cgroup *, bool)' {aka 'l=
ong unsigned int(struct mem_cgroup *, _Bool)'}
>   953 | unsigned long mem_cgroup_usage(struct mem_cgroup *memcg, bool swa=
p);
>       |               ^~~~~~~~~~~~~~~~
>
> I fixed it up (I reverted the mm-unstable tree commit) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Hey All,

what's the proper fix here?

Roman,

looks like adding mem_cgroup_usage() to include/linux/memcontrol.h
wasn't really necessary, since kfuncs don't use it anyway?
Should we just remove that line in bpf-next?

Just:
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 6a5d65487b70..229ac9835adb 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -950,7 +950,6 @@ static inline void mod_memcg_page_state(struct page *pa=
ge,
 }

 unsigned long memcg_events(struct mem_cgroup *memcg, int event);
-unsigned long mem_cgroup_usage(struct mem_cgroup *memcg, bool swap);
 unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx);
 unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item);
 bool memcg_stat_item_valid(int idx);

compiles fine.

If you agree pls send an official patch.


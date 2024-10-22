Return-Path: <linux-next+bounces-4370-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D29AA132
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 13:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED441F243B6
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 11:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A041119C55E;
	Tue, 22 Oct 2024 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RD4YMDdf"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6F199FDE
	for <linux-next@vger.kernel.org>; Tue, 22 Oct 2024 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729596859; cv=none; b=eWNOcjC2TRMvzpoA/1UekvseoAq4IzDaQ/IhYHixRlJMxEZQIdapkbUHtjwtv8NPF/W5CtW2pJS0SpQt/ZdMDsdbzjtKytPJ7pW4nEH7+3+gkU2JwcCcXoLtYKl3Dlzka0r982PVGVQX5BYfUFmkjh4bgqRDk0pGy+zAfguAnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729596859; c=relaxed/simple;
	bh=/+hUHMlV4JNYQAVEkfItrJI4PfLd3zpHj7f5QIhbEvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqPhKOsJhk6Q3RVKV+SVAQjPOs7NMXf8/YnLm1BKZWT+jHbndfgqFfUDyBngJdfN+55920U2muY4OS/gKLekJ+ACuwBF6XmENSqT5ZohKsDWhNf3XZGtYQKRaq7KaoA3dfmlO/N7UnWi/jfoB/yOG83RwY2NCqLBX4A8M8L2OWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RD4YMDdf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729596856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYYJJdVNJCwxbhCmjgFjbQC/YjUCE2wRyqdqc3yzsQU=;
	b=RD4YMDdf3RLnguA3id6ZAiYGWeBWr3ketikvPb1qawwY1GKwqoH/XH5InJ4l6bjb3SwfZV
	PEq0vguMbZFk8MXbwejZWdlfsuFjtAw+cOuUAPliZqvn6syJXyJikRDiqQlkfEstZ0kHvI
	gVcc/6hLb0lMU8XMmMFTKMHQyS8sl+Q=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-diqcN1fcO-KzOpR1WjPwXA-1; Tue, 22 Oct 2024 07:34:15 -0400
X-MC-Unique: diqcN1fcO-KzOpR1WjPwXA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-20c94c1f692so55482085ad.1
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2024 04:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729596853; x=1730201653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYYJJdVNJCwxbhCmjgFjbQC/YjUCE2wRyqdqc3yzsQU=;
        b=CK8X6RfHPuRmKSU1Lxo2BgzICqULhPa1F3wytD9z2W5C7SjEl1ooVzxwm3NthUuggO
         6Rs/8F67XfVxLHqnRut0I/f3VBgKSCmNkbHEgwEXsCf56rayjLDsWJij9MdN8AHIKrnm
         /ULcRiAQKoruEdDFW38zIAF0M7OJ6u5dg9nj3g1iy+PrtILc+M5oj6+DO0xMySdY61vE
         QvHam5/5lLATc9DLKq4q2/sscLhNFYiBQqF65tFJbdy6u7b9uYYPgdZfx26ME9xosEll
         7Ao+OeV6uI6mA5iGDM+0V7CbCOdqslBCQ7rKDDMZbWrssKNAicUzkdG2gC6DvB6E1U1B
         pkKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3SZN3W0urVlClpZ3X8c3tALZHKzIpzuraXaM/SFImacqr3x5X++GCP8UVPs4kOare8DOY5H4rQ8/q@vger.kernel.org
X-Gm-Message-State: AOJu0YzqbCFjM+fcFcEU+bVl46Nh/w8RgEiuFbf/WnPCh1hG/AbUeb0N
	UNDgTac4SkBnxW4A5rhKoqGTkSb1GFXaUXTQIryktOpcKl9dI0jl/XHKj/5xKrsUAO5eUyucJd+
	QFcZ1bNWsIqPMW4VfLLppI/BtJ5rN/HY335EdVd7N8RNZyBxENtDXZvuhFPYuRtzbuwAAxqTgPR
	RfnuousJIrAh3uwuMRpZW8EpLVz9ekgI5Z6iD/HGugNw==
X-Received: by 2002:a17:903:2449:b0:205:59b7:69c2 with SMTP id d9443c01a7336-20e96ebcf52mr52707585ad.7.1729596852769;
        Tue, 22 Oct 2024 04:34:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR4ixkc/pOTXmEgGl+yNywLYWqGrOzlIKEWGNYOeoUtNdh78o/7iZa+MwZnDJ8VTnpxDByQzz+Ous3E3GKkIk=
X-Received: by 2002:a17:903:2449:b0:205:59b7:69c2 with SMTP id
 d9443c01a7336-20e96ebcf52mr52707355ad.7.1729596852477; Tue, 22 Oct 2024
 04:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022075004.3369d8ec@canb.auug.org.au> <F1F8682B-9B60-4674-BF91-ADD15A429F1D@163.com>
In-Reply-To: <F1F8682B-9B60-4674-BF91-ADD15A429F1D@163.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 22 Oct 2024 13:34:00 +0200
Message-ID: <CAHc6FU4DEhijmGR+Fc-RiOeg59sO1t=XnsqmeArQmssOXfDjgg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 1:23=E2=80=AFPM Qianqiang Liu <qianqiang.liu@163.co=
m> wrote:
> Hi Stephen,
>
> > Commit
> >
> >  507da2cb5d8a ("KMSAN: uninit-value in inode_go_dump (5)")
> >
> > is missing a Signed-off-by from its author.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> > <mime-attachment>
>
> Yes, you=E2=80=99re right!
>
> Do you how to solve this? The commit is already in linux-next tree.

Can you resend the patch with a Signed-off-by tag?

Thanks,
Andreas



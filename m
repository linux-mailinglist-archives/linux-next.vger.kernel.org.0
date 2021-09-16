Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3777C40ECDD
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 23:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbhIPVqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 17:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238288AbhIPVqX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 17:46:23 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C99CC061574;
        Thu, 16 Sep 2021 14:45:02 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c10so11012842qko.11;
        Thu, 16 Sep 2021 14:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=+XTwNYBlgH4ZDIk567gesWNV1Jpu7Ybvxnvo/EIv1TE=;
        b=nLBnaSttySntHNjgMyU11re/jdPNZRYbHQ+/DoDgfUYiTOcWDBgP76f6pxUNOo85LM
         D5s8dcOrjnT1ObIA34myG2mMNC7I4O0uJ5aU5dgYVEoR8SmTPZ6fND/P7VSdqPownyQn
         068WqGV2GRCixENH9ULS560g5u44Fxamqfe2oF5ZutZCmbsW/W9npLk7KokALEr6vNkP
         oQTzM7x7OYqYVmH/E0ElbdKv7sVi6Zif889Sm6aYVHQKDVTQ5nf/fFldIH81UeFPhpCY
         T1APqQUCrFMU2MTSeTB6vGXO5XW7oyZ3s6ljL+bMYmoKXC0j/pvH1Msz4zDXgfVa/0ZB
         mwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=+XTwNYBlgH4ZDIk567gesWNV1Jpu7Ybvxnvo/EIv1TE=;
        b=Kvzx2E1ph/2I4eADF/717Q6iHIJbhSWFUJLholdEz8PL8XDqWMGaqP1wUFBTuy+SHZ
         tQjyyHGUwtLuK+8RmdG037NeIK3r8l1sI9+Xord3EZ5HMuYDNIkG2xBs3SobunMAc3r4
         WNMvp7o3AeQTM7+8z1y87lvOjfUGuO8bu4V6rhitPKWCJUMRgKJevSSJq/l5pcoAGMnN
         7noujegiFB7b3nO9WoutRzVnKQy6xIyr/E9gYLQjAmxZD7iXlFRfHAco5ToqUbGVpKPE
         YvKh0FM5HIyN2H4WX/q0zSMyoIX7P0af7B/6TrwKaMKbGboD4y4lM61CeP9g99pEyGAC
         IJNQ==
X-Gm-Message-State: AOAM530z+Qpahl4i9icpRCy64SpWbM5N7xwI7VuiAkyc2ZqQVsrkAntg
        05JkZSYbnQ9czxEHJLIE56U=
X-Google-Smtp-Source: ABdhPJwESZt38woWx4EfA8NKgQpJyUDsBkKgXHEqQmg57TTBQfAMYIDkWce0QE9bWiOCk2nEksZ7tw==
X-Received: by 2002:a37:a094:: with SMTP id j142mr7268153qke.465.1631828701736;
        Thu, 16 Sep 2021 14:45:01 -0700 (PDT)
Received: from [127.0.0.1] ([179.97.37.151])
        by smtp.gmail.com with ESMTPSA id 19sm3322888qkf.127.2021.09.16.14.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 14:45:01 -0700 (PDT)
Date:   Thu, 16 Sep 2021 18:43:37 -0300
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jiri Olsa <jolsa@kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 16
User-Agent: K-9 Mail for Android
In-Reply-To: <CAADnVQJ+BnWKf61rfDhKsOv05yFRXeRrMs4d443dcSOycaTRcg@mail.gmail.com>
References: <20210916161111.7f44d2a3@canb.auug.org.au> <CAADnVQJ+BnWKf61rfDhKsOv05yFRXeRrMs4d443dcSOycaTRcg@mail.gmail.com>
Message-ID: <8850F8DA-5C73-4A2C-92C7-FE17ADCD2ADB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On September 16, 2021 2:30:04 PM GMT-03:00, Alexei Starovoitov <alexei=2Es=
tarovoitov@gmail=2Ecom> wrote:
>On Wed, Sep 15, 2021 at 11:11 PM Stephen Rothwell <sfr@canb=2Eauug=2Eorg=
=2Eau> wrote:
>>
>> Hi all,
>>
>> Changes since 20210915:
>>
>> The bpf-next tree still had its build failure so I used the version fro=
m
>> next-20210913=2E
>
>Arnaldo,
>
>could you please push Andrii's fix into your tree asap
>and then cleanup/follow up with a better fix if  necessary?

It's there since yesterday:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/acme/linux=2Egit/commi=
t/?h=3Dperf/core&id=3D00e0ca3721cf2ddcb38cf676a3de61933640d31d

Replying just now since it's a holiday here and I was AFK=2E

- Arnaldo

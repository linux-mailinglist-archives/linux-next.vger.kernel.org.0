Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB5C40ED95
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 00:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbhIPW4p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 18:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233839AbhIPW4o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 18:56:44 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC57C061574;
        Thu, 16 Sep 2021 15:55:23 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id a12so5284596qvz.4;
        Thu, 16 Sep 2021 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=8/QcbhkCiqmFr+FJ//vdE11k0nLLfPnhyFhjTegl6/4=;
        b=miYxRYmKB1a4m+wK3sBGKQLEBgLzAnu5ZimRV4RPnaHEKxMF3iusaJyXzI3GxzoGNz
         kI1Ya4ow5LpCfd6NdQEbArMfsdMPINYjr8A8I5dmHwM0Be+r17ekwOUqZcnpiMp1t5fT
         LLILOMN3YkQhXHjGqNiYwNDIuyjZCORnjwadgvjxJfH/JlHgfl0kUCS1ZCThnRBoUkHd
         RUpHbu6vXgzc+MZdZ8QT0LARMncjHvS4aA1zy1GLU3z8eu1vEUPGbMX260lrA92K/a3b
         qgB0RMUCmWGEHClamhSCoAlzhPlFHBK1aC6p53uF2DaO63QfWrnZyrEF/j/mjhttKp8F
         aZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=8/QcbhkCiqmFr+FJ//vdE11k0nLLfPnhyFhjTegl6/4=;
        b=ZkLcXymndY0hPrPrIYjxqX9ysTE+JkgXPkPasrm61RKlK8vgk7kPhgKAESGB8vwG6H
         V8OzUUA7lII0iwUpxqV/z7xc1hhJawxz9RrrGQGeezqiR/JZAIiBA4Kmn6ArbR6NOkGa
         yAxVVC5KOB4k26Kin+YIB1pfcZ7w7uiQ1xiWGGPaQETucCmCgl7DfRtqWbVseMScbVtx
         PecKj+bdQrbDCRvY2nkYoXQHo4GKPBWkKq/RV6wUKcmUN8BgzOMUFSjf0Pb1PdlxpJTW
         2iM/e+VFbBsgfqt9sSg407IUOBhDgc/YsdszIvHENTrmggcgNlwnk5kwtodpYgUIDEjF
         0RDg==
X-Gm-Message-State: AOAM531QQF4/idqkpokKRqAIom92+yVPN15Wt5qGKekYtmXyJDFNlDU8
        iFg5d1HFK6a183k860QovbY=
X-Google-Smtp-Source: ABdhPJyvAm9rf7y6S60rQ+zimWAQcXc+zPVO+I7LNK4bM3zpjHQuJePR8AYTzNfer+FMmU6rdCQWSg==
X-Received: by 2002:a0c:9c8a:: with SMTP id i10mr7816674qvf.59.1631832923054;
        Thu, 16 Sep 2021 15:55:23 -0700 (PDT)
Received: from [127.0.0.1] ([179.97.37.151])
        by smtp.gmail.com with ESMTPSA id c193sm3725899qkg.120.2021.09.16.15.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 15:55:22 -0700 (PDT)
Date:   Thu, 16 Sep 2021 19:53:59 -0300
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jiri Olsa <jolsa@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 16
User-Agent: K-9 Mail for Android
In-Reply-To: <20210917084912.070e133f@canb.auug.org.au>
References: <20210916161111.7f44d2a3@canb.auug.org.au> <CAADnVQJ+BnWKf61rfDhKsOv05yFRXeRrMs4d443dcSOycaTRcg@mail.gmail.com> <8850F8DA-5C73-4A2C-92C7-FE17ADCD2ADB@gmail.com> <20210917084912.070e133f@canb.auug.org.au>
Message-ID: <81FAEBB3-FE85-49B4-BE31-68779D92C0B9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On September 16, 2021 7:49:12 PM GMT-03:00, Stephen Rothwell <sfr@canb=2Ea=
uug=2Eorg=2Eau> wrote:
>Hi all,
>
>On Thu, 16 Sep 2021 18:43:37 -0300 Arnaldo Carvalho de Melo <arnaldo=2Eme=
lo@gmail=2Ecom> wrote:
>>
>> On September 16, 2021 2:30:04 PM GMT-03:00, Alexei Starovoitov <alexei=
=2Estarovoitov@gmail=2Ecom> wrote:
>> >On Wed, Sep 15, 2021 at 11:11 PM Stephen Rothwell <sfr@canb=2Eauug=2Eo=
rg=2Eau> wrote: =20
>> >>
>> >> Changes since 20210915:
>> >>
>> >> The bpf-next tree still had its build failure so I used the version =
from
>> >> next-20210913=2E =20
>> >
>> >Arnaldo,
>> >
>> >could you please push Andrii's fix into your tree asap
>> >and then cleanup/follow up with a better fix if  necessary? =20
>>=20
>> It's there since yesterday:
>>=20
>> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/acme/linux=2Egit/co=
mmit/?h=3Dperf/core&id=3D00e0ca3721cf2ddcb38cf676a3de61933640d31d
>>=20
>> Replying just now since it's a holiday here and I was AFK=2E
>
>But that is not in any tree that is included in linux-next (and when it
>does appear, it will be in the tip tree=20

Nope, perf tools don't transit via tip for quite a while already, it goes =
to Linus directly=2E

Would it be possible to have it included in linux-next? I=2Ee=2E perf/core=
 in my repo is what should go to the next Linux release, perf/urgent goes t=
o the current merge window, just like tip=2E

- Arnaldo

which gets merged well after
>the bpf-next tree)=2E  I will include that patch as a merge fix up for
>the bpf-next tree until that patch has gone into Linus' tree =2E=2E=2E so=
,
>someone has to ensure that this patch get into Linus tree *before* the
>bpf-next tree=2E
>
>So, do you see the problem?  Linus' tree is fine on its own=2E  The
>bpf-next tree has a patch that breaks Linus' tree, but the breakage is
>not seen in the bpf-next tree because it is base on v5=2E14 and the
>interacting patch is in v5=2E15-rc1=2E

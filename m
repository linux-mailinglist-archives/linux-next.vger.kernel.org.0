Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19067202FBD
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 08:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731277AbgFVG3j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 02:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbgFVG3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 02:29:38 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3F1C061794
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 23:29:37 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id q198so6708971qka.2
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=BxvQQx+Wy1krZ65HicoIC7/eb0GyxDGrmJy22QqCBA0=;
        b=M03jICB363eoqmJKO7SRs6VbzeWui/1FNicU9CHRcFjolXrAUSsTXmsLebSn+KznZF
         +qg1WYg3oK3zdZHPyuA/ESjfDIG+RCNdp7JuD7mimhMInBnRzOiTGUWoeH4dGhaga7/C
         4iurT5ac7MzQXq8xKJX8qC3Q8JOR8RBWo/RuiGNYPEd+ZWSeFTjtDXRuJoSFgvs9fK6T
         WSqgixYxYyyeRJ74QdZitfRJe1d8rFJ0ckbVojlOKvbzdYJEHGiKR+srF61LxoZLxtNu
         Hwwj2RbGXBW5pvc6xmWVRxUZR9uovpp+KZ3PqRwQaXX9egp7jkKcrAXXIT4rOrGjVRWA
         qmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=BxvQQx+Wy1krZ65HicoIC7/eb0GyxDGrmJy22QqCBA0=;
        b=k0virYkI2zKPOX72k3IAUwXodL+hLsaRrPwv8hOkerxN7Vnjdt7WBMFAxFwGPpJBCQ
         HKWCNotOKg1NCoTIB7dou+cR2ANJqyaloEQ57cfN1PyFjZF0JHOjjxDKlCWIR/j+YQvL
         WJiwGV4vUU+WjyRjXsYSG+6CH1MxTm1S9m7fZ0o54LEBufU06FnLRZpdbnRQS6fCcPIq
         Pyxy79qhApJqV/ac8VTR4RPWGXx/lZ6tyIgXox3J7MmIPXtnV+4C249IBxQw45x5Bz15
         KZXVxSvxinwst0SAa9Rry6wrY1+Nnz/RtBogHrZWODNA3+iGPI/c3vDCO0/Sb9ZSRXR/
         XbHw==
X-Gm-Message-State: AOAM531HajwW1ltV0kf1K8FtT21iadCGltr0/vFQ2KxYTcO8iEER9ojb
        f9SD9HQr2kOLGGRIiIJnAADL1w==
X-Google-Smtp-Source: ABdhPJwUojk4T47kPFkLOHYRZhssHDuQcnpEx0Vt6cKmSFoNT8fTpSVALdMBi7q/kStIMb6uHlvEpw==
X-Received: by 2002:a37:c0f:: with SMTP id 15mr621940qkm.427.1592807377208;
        Sun, 21 Jun 2020 23:29:37 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id s42sm14692579qtk.14.2020.06.21.23.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2020 23:29:36 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next boot error: WARNING in kmem_cache_free
Date:   Mon, 22 Jun 2020 02:29:35 -0400
Message-Id: <4A35E92B-9DEF-4833-81DD-0C6FA50EB174@lca.pw>
References: <000000000000617f9d05a8a5a2c4@google.com>
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
In-Reply-To: <000000000000617f9d05a8a5a2c4@google.com>
To:     syzbot <syzbot+95bccd805a4aa06a4b0d@syzkaller.appspotmail.com>
X-Mailer: iPhone Mail (17F80)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Jun 22, 2020, at 1:37 AM, syzbot <syzbot+95bccd805a4aa06a4b0d@syzkaller=
.appspotmail.com> wrote:
>=20
> WARNING: CPU: 0 PID: 0 at mm/slab.h:232 kmem_cache_free+0x0/0x200 mm/slab.=
c:2262

Is there any particular reason to use CONFIG_SLAB rather than CONFIG_SLUB?

You are really asking for trouble to test something that almost nobody is ex=
ercising that code path very well nowadays.

Anyway, there is a patchset in -mm that might well introduce this regression=
 that we could go to confirm it, but I kind of don=E2=80=99t want to spend t=
oo much time on SLAB that suppose to be obsolete eventually.=

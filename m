Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94511E21B9
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 14:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732061AbgEZMTl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 08:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731015AbgEZMTk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 08:19:40 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3928CC03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:19:40 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id ee19so9271941qvb.11
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=iI5GDEByfzcccPx1CZ2MVqJrL75WIQY8kZJMrTcic2c=;
        b=XKz/N1CJdpPS5Nuwifs/FAEfvz2/svW5lvuwMPNXGAtQIt9sk7CXm0zyRkWG+EWPOU
         olb8CaQSNmONmsbfmD7vOoTiQIqjpjGg2v9eXxDv+v83c7L34LaNOjA8H+vzJpgvKhZi
         iDl/il8b/+odTfCmtXxeHpIcGlqp8JPdUCI3Fs3haXghjpHvEFt93ve1uqW0TP3LYFz1
         fCO0LX0nspV1nyWc9n9/pUqG+eqEQAL11uMHX3Pajg2A87ZsyCSIOntflKcjPCkt7F5D
         saMmicGNSA+QBdRMGEXNRYHcPytDH/7eYDwVsSJHKdDjndPS/VJ9otnKQk2g7KcNWqeW
         b2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=iI5GDEByfzcccPx1CZ2MVqJrL75WIQY8kZJMrTcic2c=;
        b=caP1Q6NPzeqjQCOJWBVYNVxm55iqhAv2xKsQVdAMfaEoLc/Xb1VOr29fxKHEIrRKXF
         2zU4SoMbkJzCv6zsIN4lY9TpSN5F154pRyFf2zsd1t28v/u1LlXm3qcEraqRt3OLRLlt
         hzqiDg1x/533U1jK4HBksDoh33IrQIKGE3/bOEN7AnBqkyybyRMUvjGY37G7Tdn/8HnE
         LPX0R+5ODCuJQHm741QdPQRwbn2wCl3ANG+2FpP826+NDDtiF6oV6WrD9M/eWGuwoxVk
         rmrbm3i6iW0XRzZP/s+zgv3oBTzKohJ3gTQFNYoIjNF53ib56DX2DjZE0ss1PIY5hVFw
         msJQ==
X-Gm-Message-State: AOAM5307IlKl9C7fIxS8W8lc30jPBka59llTUeyQ01v8CfsPBqFe9P72
        6sxzk6qE2+agkufo1YL5xaTqUg==
X-Google-Smtp-Source: ABdhPJye811qnLvWAYcUoCMlGqcgjL24JcOcT0bLGsmMe8kRGfVClWw0Tuj+9yIno2lvDhgWgvi3mA==
X-Received: by 2002:a0c:fe03:: with SMTP id x3mr19231630qvr.18.1590495579276;
        Tue, 26 May 2020 05:19:39 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id n85sm13817468qkn.31.2020.05.26.05.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 05:19:38 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next build error (8)
Date:   Tue, 26 May 2020 08:19:37 -0400
Message-Id: <3979FAE7-0119-4F82-A933-FC175781865C@lca.pw>
References: <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
In-Reply-To: <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>
X-Mailer: iPhone Mail (17E262)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 26, 2020, at 8:09 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
>=20
> +linux-next and XFS maintainers
>=20
> Interesting. This seems to repeat reliably and this machine is not
> known for any misbehavior and it always happens on all XFS files.
> Did XFS get something that crashes gcc's?

Are you still seeing this in today=E2=80=99s linux-next? There was an issue h=
ad already been sorted out.=

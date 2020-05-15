Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D23A1D5920
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgEOSg3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 14:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgEOSg2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 May 2020 14:36:28 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44439C05BD09
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 11:36:28 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id s1so3588310qkf.9
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=3jEh/c8X5kAh+mw2s8BlpUXCIYSTIWmWDs3YUbpKhds=;
        b=PhNfluhoV7c1JGujBvuA9/GYqlD5DjmJIveS+0n2VX3jtO4FvwwtRfMyWghIeo7erW
         gMMFC8WYCc+v55d5zLp9VxQxVGdz1bMBfcoqLJS08TKH1eNbFPQy20ZBF0jF+mRN3tEf
         o29q71gxJCJuFN/ej9tEdbM7ZOd5FGdqIg8jESsOjSOoNFLUb8ytzquSOxE3E/fhLXla
         6CTcAud+uGtcpN+TQONR+B0fKvHarlzXdm8x0LIE/ZpxhUrcFZaYdqxkU/ECHjpN6bZJ
         e5PMDh9BThuBCEWNZCn0FLkP4l67yImZHXlZq0oEW8XwYe8gzFFJyhnG9Yz3Kc3Beoa4
         mQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=3jEh/c8X5kAh+mw2s8BlpUXCIYSTIWmWDs3YUbpKhds=;
        b=WZaxNO+2QqzlThIw4BBowlZ8vR8FbydJ4XBz3SWBaVIrGRocItsIqpSWQCN2QmkOA6
         r5bIFBO/y48Im8ZCwErWLy/dptQAhJBrovSWkDHeB/3fyQsaWjwneaXXIBXs/4AOpHtx
         LUeXEcKfTnfGXSEzLHebtCnaeN6uATop5Q3JNdwWBF/ldl7D0qeMtp74FNNI4iNOu+ho
         Zp62dmlx1Av/X4JTOsl4SlqgQT9f3Z3XUcNhG2DLHcSJxmC70Uqsw3oAQtyk1lmywW4s
         7fznRnMsATWWATJZ6grbQI0gduOVL8D2JcSiKStR8Z8vy8vxhIKj8bUU1pzyHR4B/GQ0
         ZSyw==
X-Gm-Message-State: AOAM530KHTLM9+zv9VxEBkO+EeMzTFOcc+4iJZtD3AEQHePuZtGFP8IM
        y9mss7qFY3mElz7fRcXDSA/hgvbOHLa4YQ==
X-Google-Smtp-Source: ABdhPJxzDm0p+lh/LmOvXYP48iojGEO/n1SJLLCSOXcwdvKDOtZ2hEon3oDubvx0zGhWM8OmH6bO0Q==
X-Received: by 2002:a37:5804:: with SMTP id m4mr4655956qkb.109.1589567787258;
        Fri, 15 May 2020 11:36:27 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id n9sm2165469qkn.10.2020.05.15.11.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 11:36:26 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
Date:   Fri, 15 May 2020 14:36:26 -0400
Message-Id: <CA610F47-290E-4826-B1D9-7CE09D7CEA6D@lca.pw>
References: <20200514181305.GT2869@paulmck-ThinkPad-P72>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
In-Reply-To: <20200514181305.GT2869@paulmck-ThinkPad-P72>
To:     paulmck@kernel.org
X-Mailer: iPhone Mail (17D50)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 14, 2020, at 2:13 PM, Paul E. McKenney <paulmck@kernel.org> wrote:
>=20
> Fair enough!  And yes, the Linux kernel is quite large, so I certainly am
> not asking you to test the whole thing yourself.

Ok, I saw 0day bot also started to report those which is good. For example,

lkml.org/lkml/2020/5/12/1358

which so far is nit blocking 0day on linux-next since it does not use panic_=
on_warn yet (while syzbot does).

Thus, I am more convinced that we should not revert the commit just for syzb=
ot until someone could also convince 0day to select RCU_EXPERT and then DEBU=
G_RCU_LIST?=

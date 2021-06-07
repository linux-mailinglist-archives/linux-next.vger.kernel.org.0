Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64239DD7E
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 15:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhFGNUv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 09:20:51 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:43684 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhFGNUu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 09:20:50 -0400
Received: by mail-pf1-f172.google.com with SMTP id m7so121881pfa.10
        for <linux-next@vger.kernel.org>; Mon, 07 Jun 2021 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=myn26nsP/aTkUzfctzHz+RQwPVuETM0HNlMtdoGe1AQ=;
        b=bxi45qMiX1zMJAvFAaUKFFKLDCq6y2TWOPZRrRjGeuBBkAlAw1/wt7lcvQVuiQCn1/
         Cupi+K/+bzdIPDrTcLxZiQdgSxDatgIMpltQWIeMH0BNK/6FLDnce99QjIewuOBTPHsS
         gXUJp1d7OeXO/8gglYzXfficAYbDqYxO9DEZjl3R6mC53WByJKdbJJq8xiWDfmEnAU02
         8+mljcA6S+TFUNKALppAgOLHuOKISi48O+TBecYIAfY/d3bNXsdYZwhAzwK714/qmEWE
         RSmJaOtTKlpDoAAAME5F3kUhwxusYizqgRmS6LJOTiKj2ZK0CgMzNIbxWXZieb0bVVOQ
         HgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=myn26nsP/aTkUzfctzHz+RQwPVuETM0HNlMtdoGe1AQ=;
        b=em59DMBO67ZMXmQOO661nAY1xXc3aE5FeCD2IhOkI91euNNUmcDhPvSVEMOQNSoxNa
         ZxAxE8J4WBxBuep3rGsbU3N+tfh4QD2r1HjvH3G1zMBJEwt5yR/gsBlUZzkosj8If1zL
         rchBSfxnuYvRHt5B/n6mZYCrc+JzO3Z4AU9uDySoW5rrRdX/au1Nhix1VPMLEUnZ1qZf
         31J50s4BnO785XmNQl29T4X+d8ksOuJzn8mMYO1onPIOEbhfN0uxvs2B8NVZ8a5tbTXX
         Q28LV8UPAT2HJ5ICnwhG+KcjRFfhuNAGz/aDE3Y7AStV6Mz0LzP1/k1id9lo/dxgAwaw
         f+rA==
X-Gm-Message-State: AOAM532cgLFjnz0KjZLwVU2gZfUNeJGrnHHKmJCiFRatPmG9SSeBgEE9
        7Upyl1wDG8DM9QSf0eFxeg7OUAyE2NOQvZ1q
X-Google-Smtp-Source: ABdhPJw/wIEFM4CtIm/+Vo4JMySsgzyWUiztP13lbMeYJgTL+0FRnWQ3hSIPgR12YSPVm0yOquf8IQ==
X-Received: by 2002:aa7:808b:0:b029:2ef:cdd4:8297 with SMTP id v11-20020aa7808b0000b02902efcdd48297mr5842588pff.27.1623071868247;
        Mon, 07 Jun 2021 06:17:48 -0700 (PDT)
Received: from hyeyoo ([110.70.55.156])
        by smtp.gmail.com with ESMTPSA id n37sm8287939pfv.47.2021.06.07.06.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 06:17:48 -0700 (PDT)
Date:   Mon, 7 Jun 2021 22:17:43 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     linux-next@vger.kernel.org, sfr@canb.auug.org.au
Subject: Re: [next 20210607] Link failed due to unresolved symbol
 should_fail_alloc_page
Message-ID: <20210607131743.GA857940@hyeyoo>
References: <20210607131540.GA810993@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607131540.GA810993@hyeyoo>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


compiled with clang 11.0.0

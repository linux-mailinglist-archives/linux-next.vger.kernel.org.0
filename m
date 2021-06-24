Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04133B3470
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 19:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhFXRL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 13:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhFXRL4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2021 13:11:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341F4C0617AE
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 10:09:32 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e33so5262324pgm.3
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=p95plxgcKdT8+TUJCmcKdAyJL6L8C+j3muAeTI6tbvEOMwKUFZvBH22Z3GEGxdnUZH
         d9XkDasjcz/bUj2n1PkWxPPQL/Sxtf1a7ckN43IkWwU4a9v6DYeOi9Tg8DPYHl700hH/
         xlmv54Ir2NUVB8zwaX1UsxTzP5GUW3mdywmszCeflzWKbXzDgkMNhx+qVsi3FklHnD5x
         fSDWvxz3POXOJ/0yZM+F2G99rPMTFJK+bPA5TWYu0VJpvpEjmQwRSgXLB6dx+kXpC0Uz
         JX+JhI0lSB7VkwJTdkbApCrUx6TGzp99N5mAm/d0lil4hmexz93RFAPSpMzmwkjNchKB
         rXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=MLpTY411Z6QrlQ/N9KFnlnYKFt8Ke0GKHU47G1T2579Qow5anOOnR15a4SOpurzvPt
         4MNNfDE6aMaRWDY8ahm7cpgOKu+ey8hv1huzfRrRzfvCx22QdfBW22F0YEa3PdkhH/pR
         +Pmd1GAQzDHk/EyQ44yttSuDTO+LZpMzvRWTtNDb5ng+1g/kd27KmgQSE5Bn+RJ3o1uH
         74G9+o9TUyi+4tDQnqsI5mtesyLSMIhvnG8nRXkybJSooTt5SSyWsnK2IDoq9wBC81c1
         WmEWFvPm6bNDl+bhMRg8iuKMVGlx+SVlFXpumv50t5bfgqEk4/U240uFT/JnuSuYlEDi
         y85g==
X-Gm-Message-State: AOAM532szKpBhs6JyipAIWXBSRTn4c2iWKTYTt3LH0W8BH/qEAbksAkr
        ud5Pb1iMiq5B2TTHz0vHJS6MGjf+QoL7BhTroJAllp0nWqtpnQ==
X-Google-Smtp-Source: ABdhPJzkYUuO368jts0QgMQyJe9SHzg0U698qd8KdfojEfYsXnHtwMfPGxVHmw7fwQ64+IhHRhAEJH5nusdeW4BWzcA=
X-Received: by 2002:a05:6e02:524:: with SMTP id h4mr4098121ils.255.1624554560853;
 Thu, 24 Jun 2021 10:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:3aa:0:0:0:0 with HTTP; Thu, 24 Jun 2021 10:09:20
 -0700 (PDT)
Reply-To: tutywoolgar021@gmail.com
In-Reply-To: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
References: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
From:   tuty woolgar <faridaamadoubas@gmail.com>
Date:   Thu, 24 Jun 2021 17:09:20 +0000
Message-ID: <CADB47+607zNBfYFb4bj0nUhuuYgAdwT=G_wJ9-EeV0ESHe56Jg@mail.gmail.com>
Subject: greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

My greetings to you my friend i hope you are fine and good please respond
back to me thanks,

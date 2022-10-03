Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14E55F2EEE
	for <lists+linux-next@lfdr.de>; Mon,  3 Oct 2022 12:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiJCKkY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Oct 2022 06:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiJCKkB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Oct 2022 06:40:01 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21521B9C2
        for <linux-next@vger.kernel.org>; Mon,  3 Oct 2022 03:39:45 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id u21so9755909edi.9
        for <linux-next@vger.kernel.org>; Mon, 03 Oct 2022 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=RHHmAOienDzk5McXyVq7AyXFgmsKNvHjoqFyqlyCgjT1QBoFpxKv9Uv17ulESMjY4i
         nOZSC1HdGsv82NGwdY1N4uleC4VH/rT2CUE7ux5jgQjcRMjfiuZs4EPrzjomPBCIRjjF
         tcoLTkOXwtM4EfN8reFn67RiN1lX4dtfnlOupwHmLEWTZjN6dT+pKoA782cD5YxzZonI
         EHgKfhYIjFU7+1GSbWZtRpIDGKy1kYbo1J7MxwcI5zGc+ehlTgHDgqqEZaMskur1NiX6
         V1ZwZ4lKy0DxcpkHO+bG7O3aRzTZP3JxmNikA7jZ/3N42E5h+cAgymt5j4NSAcUO5qXY
         W8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=nz4JFpNWnWAbK6l7GnonEtyRRMy5lRpMYRw8f8jyjE6Z4XiN15S/8RKK/OyKuFY2Ck
         WWkz/vRsgV/ymWBYHBc+sg/L8xeUC+3jgd/Q9H0iI2Tfh8Xb5njXRZfaBw3qjlUaStl5
         +S0yX+uL/3Pt54Nw6b2DSfmhioHTMZTuZwU5mmG/5gxD3r1BCSTktrMR57xHgGPIM+S6
         TiNZHHdD9NJkDQhxIMoDdY1rM7IEF0diQXRQ6+ZqmV1InDYBybL7RNUPBKYJloyBgehK
         JnCurMtnct4Ig8wyzTedPdK+HXV9OjmnvxwUguP0kaKo2swHqZdjB/9KfkoR46yejzc7
         BLXw==
X-Gm-Message-State: ACrzQf0cuEWWeZ5wPYVrlltmZxvUoHqy+uYA5IIXpxZZDbEHUz8Tereg
        irlLJAWv865yTJ66ZYRvPIRDkqiNmeDITP64gSI=
X-Google-Smtp-Source: AMsMyM55rxqZxZJwCvYpZJQU+G5rYXAdOj3bJi8qPp2s4BD9Klxipg+IvcoIxwcXKEUVoEBkeX9RJH+n+jvrprCsnBw=
X-Received: by 2002:a05:6402:1856:b0:458:db1e:20ec with SMTP id
 v22-20020a056402185600b00458db1e20ecmr6260068edy.14.1664793584281; Mon, 03
 Oct 2022 03:39:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:614c:b0:25:2f9b:6a8e with HTTP; Mon, 3 Oct 2022
 03:39:43 -0700 (PDT)
Reply-To: davidnelson7702626@gmail.com
From:   david <nenkan1975@gmail.com>
Date:   Mon, 3 Oct 2022 11:39:43 +0100
Message-ID: <CAFO9AXjZUvFb_nNhB4gNdKk=jV50DXJo6uThtUvw0WbsFvrP2Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:542 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5055]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [nenkan1975[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nenkan1975[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [davidnelson7702626[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello friend, I want to send money to you to enable me invest in your
country get back to me if you are interested.

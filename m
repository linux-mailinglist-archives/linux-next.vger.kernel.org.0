Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26941A904C
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 03:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392453AbgDOBS1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 21:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392449AbgDOBSY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 21:18:24 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B898C061A0C
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 18:18:23 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id i22so1746835otp.12
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 18:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U1l2/pt2vcXJs4JHOfaqDncBBzdHatpYCeFPNCdgXmY=;
        b=B+V2QJhLQsBm/e5lZ06FfL9w72jKW1Ok92LzH6+jMc/K7B3adM/3jfrxAccX7mEHh/
         viSNMwIytJNitnDOPAGcYsDZ6hg1F1B2KRhSZad2SqUfaZAKtNSEHMr/KqZntR31eW9b
         mnqU+JLn3CH43CYPUI/cvfgs7CxJv9F/MIgF7y/BSBRwSs+gOOq6SNbqr2GveCzOkz5p
         CUScmSV7n51+5Onkqn/h6yrEICD/toxBejyWTEtaTdAfPvPPnMW8YO5SMzRY12wbQNpq
         qrdse3QF/S6pP6v4PWXI6zy50Cg+YLM4nPIGu9iSofBzsZtwerlh6l/kv037LJENL7pz
         wYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U1l2/pt2vcXJs4JHOfaqDncBBzdHatpYCeFPNCdgXmY=;
        b=dGeFtJtR486hQFo4kFZC4L8qA26f3W4o12LH0p50zucD/eaO9f7Ke8ieT51xI6urtf
         jYAeiMaHJ0cidW1wO3Olj7stut3A3+sYRPvsofieBMV4iiUc0rkdQkPansQsI4jeVM1k
         bBsLfJscQl+pkn3lLBUnEIVgiusVspWF5XWxj5Odg8JdvKjaLFgElFD7+LuPCL0a2s3E
         /Bcd23W+q7FdKqx7Oc9bxWdOLZaUYPGK6G72dDMtQoW+2i5DCo4nq0QanxCL6lUYoies
         pAOfh3xK+32AjoHkI/KHc29n1COmXDFGNz9e13v0B8B5d2/2un0xtlslr32b2HgfjPxX
         FY7w==
X-Gm-Message-State: AGi0PubV+iBN8B02zuv0X/z3b9CT6Mk9vGtJ7bvRaDSZXguEF9DGxH+b
        MdjUNscwke0SdHE0CVIFHvRr+Vd//j+k5Nfmnt7VrQ==
X-Google-Smtp-Source: APiQypK9nKDX/Fv38V2E+Fpv1Q1bTceAzMb90oayw7n7ZzkqoIHvTjqwdd5FRXUJe5CujZpV+QwZrLgaUvSjidfYTdQ=
X-Received: by 2002:a9d:3988:: with SMTP id y8mr11026479otb.352.1586913502446;
 Tue, 14 Apr 2020 18:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200415104152.4d770116@canb.auug.org.au>
In-Reply-To: <20200415104152.4d770116@canb.auug.org.au>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 18:18:11 -0700
Message-ID: <CALAqxLVN_MZ7XWsg99dhy1=Vde_XSCHey78mrxRuu7a_THxYYw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the qcom tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Gross <agross@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 14, 2020 at 5:41 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the qcom tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/soc/qcom/rpmh-rsc.c: In function '__tcs_buffer_write':
> drivers/soc/qcom/rpmh-rsc.c:484:3: error: implicit declaration of function 'trace_rpmh_send_msg_rcuidle'; did you mean 'trace_rpmh_send_msg_enabled'? [-Werror=implicit-function-declaration]
>   484 |   trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |   trace_rpmh_send_msg_enabled
> cc1: some warnings being treated as errors
>
> I don't know why this error only started happening today.  However
> reverting commit
>
>   1d3c6f86fd3f ("soc: qcom: rpmh: Allow RPMH driver to be loaded as a module")
>
> fixes the build, so I have done that for today.


Ah. I'm guessing the newly added rpmh-rsc code depends on rpmh being built in.

I'll take a look at it.

thanks
-john

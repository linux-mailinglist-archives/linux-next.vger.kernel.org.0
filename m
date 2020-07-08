Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D173217D23
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 04:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGHCqN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 22:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbgGHCqM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 22:46:12 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6907BC061755;
        Tue,  7 Jul 2020 19:46:12 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w6so48797671ejq.6;
        Tue, 07 Jul 2020 19:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XuQXgKfjhRPfHlI6CUS9W8MpPRXyJFXM/VMcVD9TWSg=;
        b=ZHppF9kI4mXLPuSLMpLIZJIATEcKJyXFvjR+sgZlNQVkPpRF7/UQTAW3e3oCFUefSZ
         ZmtO5jwWdkEuY4gEkjAHdOR4nOrFhs2xLcPFyZCLFl4FibCkmmUv8TDU8of1bN2lFET5
         UQT2mnqTzsQT5mVhSfwfs9uABpRRfYSopCH49SVJSDJXmKfshxVWJTGJZXvGz2Pd8sLB
         rhbK/BSxfB86gfl/7qnIBnoUPUoIne9egWs1BbscFuF5I+cw9YspYJC1hS5gmPS+Okta
         xkw2i3TcD18rjgrEPvg5UkGbReMo+p6CcJ6p+/R0AzTYz2ZINiEmkfhBe3gvP2p2B7UY
         HGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XuQXgKfjhRPfHlI6CUS9W8MpPRXyJFXM/VMcVD9TWSg=;
        b=WPaDhUZ24TrpNuuQwQkWR49zBfBOhd4ChoFZOti9woh/g+3f6owQSjDiFYKME2tQfg
         bBl8pjRrzl+NsBHw5hmAMaeladKqO+7tj3M8QpAPvBKt99p23PgSiaRAMCxl7jXs9a9V
         oXUp8rd+ii8b0XYfO/wLVaQ1p8HcDInuOCm2wJBmSH2fan/C88AAMNxZWPCXQdOJI6OQ
         bNY/LwvWFsWSiBGMpMBfHlfFEuMKrU/Kf3yZgS71n774EiUnrJ+TO+l23JUoMcAL9xFy
         44MOzTmY+aF6j2uFackowPxpnW0Hhdr7M2AI0saB04DAnANYzVNITcKyLtiSCRr4rFBO
         vRxQ==
X-Gm-Message-State: AOAM531xfvo2jx2pcC7T/rc4E51lUlQPhfGq6hf/ejapg/GNMzv+6sfo
        KJVIF0Hh75N0l1yJHzHRQSV4V8NVBvq49pKt1Oc=
X-Google-Smtp-Source: ABdhPJxYdhLRcy744oW+MNtiCcL1RmFwk3vsdiHmDMArMFLyhT1qlrWXymL9oHuKbRVyql22v0GBVdidoxnHGMqGO+0=
X-Received: by 2002:a17:906:31c8:: with SMTP id f8mr38085963ejf.269.1594176371013;
 Tue, 07 Jul 2020 19:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180800.549b561b@canb.auug.org.au> <2f85f3c4-a58b-f225-a533-86e209a4651c@infradead.org>
 <7ae1c7e3-ce8d-836b-1ae7-d4d00bd8f95c@broadcom.com>
In-Reply-To: <7ae1c7e3-ce8d-836b-1ae7-d4d00bd8f95c@broadcom.com>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed, 8 Jul 2020 08:16:00 +0530
Message-ID: <CAOh2x=nGvuzicr77y-X5u8FWP7_G_UGosvdmtns01VCgtM_s=g@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 7 (scsi/lpfc/lpfc_init.c)
To:     James Smart <james.smart@broadcom.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        dick kennedy <dick.kennedy@broadcom.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi James,

On Tue, Jul 7, 2020 at 11:43 PM James Smart <james.smart@broadcom.com> wrote:
>
> On 7/7/2020 10:09 AM, Randy Dunlap wrote:
> > On 7/7/20 1:08 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200706:
> >>
> > on i386:
> >
> > when CONFIG_ACPI is not set/enabled:
> >
> >
> > ../drivers/scsi/lpfc/lpfc_init.c:1265:15: error: implicit declaration of function 'get_cpu_idle_time'; did you mean 'get_cpu_device'? [-Werror=implicit-function-declaration]
> >
> >
> > The cpufreq people want justification for using

I am one of cpufreq people :)

> > get_cpu_idle_time().  Please see
> > https://lore.kernel.org/linux-scsi/20200707030943.xkocccy6qy2c3hrx@vireshk-i7/
> >
>
> The driver is using cpu utilization in order to choose between softirq
> or work queues in handling an interrupt. Less-utilized, softirq is used.
> higher utilized, work queue is used.  The utilization is checked
> periodically via a heartbeat.

I understand that you need to use this functionality, what I was
rather asking was
why do you need to use a routine that is for cpufreq related stuff only.

I also see that drivers/macintosh/rack-meter.c has its own
implementation for this.

What I would suggest is that, if required, we should add/move a
generic implementation
of this to another file (which is available to all) and then let
everyone use it.

--
viresh

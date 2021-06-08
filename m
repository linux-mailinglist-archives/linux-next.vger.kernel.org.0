Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822E539FE57
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbhFHSDx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:03:53 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:46050 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbhFHSDw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:03:52 -0400
Received: by mail-pj1-f49.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso2767293pjb.4
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sFY27QxyRczOf2r+7GIDSJkoWMM7XtaSbcQ1mLV7iO8=;
        b=e9f5cmebyCf/z045Y6YWE7KeGWXr7PmLAVFcgRQ33te1QnEpOWgDWS82H1TrC6F3Ry
         mimH6STWOfc/5anArmKPWmzkJUBjNVeZvseDYAkQ9Lq9xBDyppB3RsACm2XsL+T/+itQ
         sAPy2uK3obcxyTPUMzIrIeFadzhNtmBBcP6kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sFY27QxyRczOf2r+7GIDSJkoWMM7XtaSbcQ1mLV7iO8=;
        b=G/rnpKvwNaFjRYlMQqC0ogJYRL36FDznlyayo5Wq9Ywm2YXrvCRJphfc2mj41qW6eZ
         eJGYXXbYewV40p1kHicUagQ2D6hSdZXZ/aqN667bn8VC6whN//EtUSQ9seIOaSjs3Niv
         E+/KRrxRbySeY99zXFLvnyVrc2S5jcpp66mNu0DMw3zRfaAWhTP+Mb/+lv94SVrWoBIP
         /frnt/MgKPBrJsqlZjCUKGHNBm1eCtgtRFP3cVIIBOlSMWVf33rUBu2IFcc7pfNx2B2V
         XTGmW9newt9D8YFvjLGDOq5K9JTpSkg2aL4730hf2JCFbFCrgAOOsuJQcKjFLaGFe9YY
         KynQ==
X-Gm-Message-State: AOAM532MvTUrb9iese45sKZe5miy2Ou8DorPjkgFQygITfWVfIJhQJKZ
        jUVWR1SGNR+qsRD+uV9j5TeAcQ==
X-Google-Smtp-Source: ABdhPJya7PnJrOlOCwlf5Kqi9fDWP8Nvm1RUeuyT76SC7jDVwAyGiCW4PbBNkDWkB37B2Vfdl1OKHg==
X-Received: by 2002:a17:90b:1908:: with SMTP id mp8mr1644388pjb.106.1623175259768;
        Tue, 08 Jun 2021 11:00:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j9sm15674705pjy.25.2021.06.08.11.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:00:58 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:00:57 -0700
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: current_value_store(): NO_EFFECT
Message-ID: <202106081100.1A98C8E679@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210608 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Jun 3 12:56:40 2021 +0200
    a7314b3b1d8a ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")

Coverity reported the following:

*** CID 1505158:    (NO_EFFECT)
/drivers/platform/x86/think-lmi.c: 566 in current_value_store()
560     	}
561
562     	ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
563     	if (ret)
564     		goto out;
565
vvv     CID 1505158:    (NO_EFFECT)
vvv     Comparing an array to null is not useful: "tlmi_priv.pwd_admin->password", since the test will always evaluate as true.
566     	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
567     		ret = tlmi_save_bios_settings(auth_str);
568     	else
569     		ret = tlmi_save_bios_settings("");
570
571     out:
/drivers/platform/x86/think-lmi.c: 540 in current_value_store()
534     		return -ENOMEM;
535
536     	/* Strip out CR if one is present */
537     	p = strchrnul(new_setting, '\n');
538     	*p = '\0';
539
vvv     CID 1505158:    (NO_EFFECT)
vvv     Comparing an array to null is not useful: "tlmi_priv.pwd_admin->password", since the test will always evaluate as true.
540     	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
541     		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
542     				tlmi_priv.pwd_admin->password,
543     				encoding_options[tlmi_priv.pwd_admin->encoding],
544     				tlmi_priv.pwd_admin->kbdlang);
545     		if (!auth_str) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505158 ("NO_EFFECT")
Fixes: a7314b3b1d8a ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")

Thanks for your attention!

-- 
Coverity-bot

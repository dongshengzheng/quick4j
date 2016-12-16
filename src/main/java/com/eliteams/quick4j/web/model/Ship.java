package com.eliteams.quick4j.web.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class Ship {
    private int id;

    private String imo;

    private String status;

    private String name;

    private String buildyear;

    private String builder;

    private String model;

    private String ice;

    private String owned;

    private String bunkers;

    private String twopenult;

    private String threepenult;

    private String tpc;

    private String callsign;

    private String hp;

    private String fourpenult;

    private String nt;

    private String onelast;

    private String twolast;

    private String threelast;

    private String fourlast;

    private String onepenult;

    private String loa;

    private String beam;

    private String ggt;

    private String dwt;

    private String flag;

    private String classs;

    private String nextSs;

    private String nextDd;

    private String speed;

    private String draft;

    private String ldt;

    private String mmaker;

    private String mmype;

    private String mbr;

    private String mcyl;

    private String amake;

    private String atype;

    private String aqty;

    private String arated;

    private String acyl;

    private String ctype;

    private String cqty;

    private String baux;

    private String blarge;

    private String bgas;

    private String bexhaust;

    private String emaker;

    private String etype;

    private String wanchor;

    private String wcapstan;

    private String tasishaft;

    private String anchor;

    private String anchorchain;

    private String air;

    private String freon;

    private String refrige;

    private String tubluar;

    private String propeller;

    private String filename;

    private byte[] filedata;

    private Date inputdate;

    public MultipartFile getShipImage() {
        return shipImage;
    }

    public void setShipImage(MultipartFile shipImage) {
        this.shipImage = shipImage;
    }

    private MultipartFile shipImage;

    private Type type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImo() {
        return imo;
    }

    public void setImo(String imo) {
        this.imo = imo == null ? null : imo.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }



    public String getBuilder() {
        return builder;
    }

    public void setBuilder(String builder) {
        this.builder = builder == null ? null : builder.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public String getIce() {
        return ice;
    }

    public void setIce(String ice) {
        this.ice = ice == null ? null : ice.trim();
    }

    public String getOwned() {
        return owned;
    }

    public void setOwned(String owned) {
        this.owned = owned == null ? null : owned.trim();
    }

    public String getBunkers() {
        return bunkers;
    }

    public void setBunkers(String bunkers) {
        this.bunkers = bunkers == null ? null : bunkers.trim();
    }



    public String getTpc() {
        return tpc;
    }

    public void setTpc(String tpc) {
        this.tpc = tpc == null ? null : tpc.trim();
    }

    public String getCallsign() {
        return callsign;
    }

    public void setCallsign(String callsign) {
        this.callsign = callsign == null ? null : callsign.trim();
    }

    public String getHp() {
        return hp;
    }

    public void setHp(String hp) {
        this.hp = hp == null ? null : hp.trim();
    }



    public String getNt() {
        return nt;
    }

    public void setNt(String nt) {
        this.nt = nt == null ? null : nt.trim();
    }

    public String getOnelast() {
        return onelast;
    }

    public void setOnelast(String onelast) {
        this.onelast = onelast == null ? null : onelast.trim();
    }

    public String getTwolast() {
        return twolast;
    }

    public void setTwolast(String twolast) {
        this.twolast = twolast == null ? null : twolast.trim();
    }

    public String getThreelast() {
        return threelast;
    }

    public void setThreelast(String threelast) {
        this.threelast = threelast == null ? null : threelast.trim();
    }

    public String getFourlast() {
        return fourlast;
    }

    public void setFourlast(String fourlast) {
        this.fourlast = fourlast == null ? null : fourlast.trim();
    }

    public String getTwopenult() {
        return twopenult;
    }

    public void setTwopenult(String twopenult) {
        this.twopenult = twopenult;
    }

    public String getThreepenult() {
        return threepenult;
    }

    public void setThreepenult(String threepenult) {
        this.threepenult = threepenult;
    }

    public String getFourpenult() {
        return fourpenult;
    }

    public void setFourpenult(String fourpenult) {
        this.fourpenult = fourpenult;
    }

    public String getOnepenult() {
        return onepenult;
    }

    public void setOnepenult(String onepenult) {
        this.onepenult = onepenult;
    }

    public String getLoa() {
        return loa;
    }

    public void setLoa(String loa) {
        this.loa = loa == null ? null : loa.trim();
    }

    public String getBeam() {
        return beam;
    }

    public void setBeam(String beam) {
        this.beam = beam == null ? null : beam.trim();
    }

    public String getGgt() {
        return ggt;
    }

    public void setGgt(String ggt) {
        this.ggt = ggt == null ? null : ggt.trim();
    }

    public String getDwt() {
        return dwt;
    }

    public void setDwt(String dwt) {
        this.dwt = dwt == null ? null : dwt.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public String getClasss() {
        return classs;
    }

    public void setClasss(String classs) {
        this.classs = classs == null ? null : classs.trim();
    }



    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed == null ? null : speed.trim();
    }

    public String getDraft() {
        return draft;
    }

    public void setDraft(String draft) {
        this.draft = draft == null ? null : draft.trim();
    }

    public String getLdt() {
        return ldt;
    }

    public void setLdt(String ldt) {
        this.ldt = ldt == null ? null : ldt.trim();
    }

    public String getMmaker() {
        return mmaker;
    }

    public void setMmaker(String mmaker) {
        this.mmaker = mmaker == null ? null : mmaker.trim();
    }

    public String getMmype() {
        return mmype;
    }

    public void setMmype(String mmype) {
        this.mmype = mmype == null ? null : mmype.trim();
    }

    public String getMbr() {
        return mbr;
    }

    public void setMbr(String mbr) {
        this.mbr = mbr == null ? null : mbr.trim();
    }

    public String getMcyl() {
        return mcyl;
    }

    public void setMcyl(String mcyl) {
        this.mcyl = mcyl == null ? null : mcyl.trim();
    }

    public String getAmake() {
        return amake;
    }

    public void setAmake(String amake) {
        this.amake = amake == null ? null : amake.trim();
    }

    public String getAtype() {
        return atype;
    }

    public void setAtype(String atype) {
        this.atype = atype == null ? null : atype.trim();
    }

    public String getAqty() {
        return aqty;
    }

    public void setAqty(String aqty) {
        this.aqty = aqty == null ? null : aqty.trim();
    }

    public String getArated() {
        return arated;
    }

    public void setArated(String arated) {
        this.arated = arated == null ? null : arated.trim();
    }

    public String getAcyl() {
        return acyl;
    }

    public void setAcyl(String acyl) {
        this.acyl = acyl == null ? null : acyl.trim();
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype == null ? null : ctype.trim();
    }

    public String getCqty() {
        return cqty;
    }

    public void setCqty(String cqty) {
        this.cqty = cqty == null ? null : cqty.trim();
    }

    public String getBaux() {
        return baux;
    }

    public void setBaux(String baux) {
        this.baux = baux == null ? null : baux.trim();
    }

    public String getBlarge() {
        return blarge;
    }

    public void setBlarge(String blarge) {
        this.blarge = blarge == null ? null : blarge.trim();
    }

    public String getBgas() {
        return bgas;
    }

    public void setBgas(String bgas) {
        this.bgas = bgas == null ? null : bgas.trim();
    }

    public String getBexhaust() {
        return bexhaust;
    }

    public void setBexhaust(String bexhaust) {
        this.bexhaust = bexhaust == null ? null : bexhaust.trim();
    }

    public String getEmaker() {
        return emaker;
    }

    public void setEmaker(String emaker) {
        this.emaker = emaker == null ? null : emaker.trim();
    }

    public String getEtype() {
        return etype;
    }

    public void setEtype(String etype) {
        this.etype = etype == null ? null : etype.trim();
    }

    public String getWanchor() {
        return wanchor;
    }

    public void setWanchor(String wanchor) {
        this.wanchor = wanchor == null ? null : wanchor.trim();
    }

    public String getWcapstan() {
        return wcapstan;
    }

    public void setWcapstan(String wcapstan) {
        this.wcapstan = wcapstan == null ? null : wcapstan.trim();
    }

    public String getTasishaft() {
        return tasishaft;
    }

    public void setTasishaft(String tasishaft) {
        this.tasishaft = tasishaft == null ? null : tasishaft.trim();
    }

    public String getAnchor() {
        return anchor;
    }

    public void setAnchor(String anchor) {
        this.anchor = anchor == null ? null : anchor.trim();
    }

    public String getAnchorchain() {
        return anchorchain;
    }

    public void setAnchorchain(String anchorchain) {
        this.anchorchain = anchorchain == null ? null : anchorchain.trim();
    }

    public String getAir() {
        return air;
    }

    public void setAir(String air) {
        this.air = air == null ? null : air.trim();
    }

    public String getFreon() {
        return freon;
    }

    public void setFreon(String freon) {
        this.freon = freon == null ? null : freon.trim();
    }

    public String getRefrige() {
        return refrige;
    }

    public void setRefrige(String refrige) {
        this.refrige = refrige == null ? null : refrige.trim();
    }

    public String getTubluar() {
        return tubluar;
    }

    public void setTubluar(String tubluar) {
        this.tubluar = tubluar == null ? null : tubluar.trim();
    }

    public String getPropeller() {
        return propeller;
    }

    public void setPropeller(String propeller) {
        this.propeller = propeller == null ? null : propeller.trim();
    }

    public String getBuildyear() {
        return buildyear;
    }

    public void setBuildyear(String buildyear) {
        this.buildyear = buildyear;
    }

    public String getNextSs() {
        return nextSs;
    }

    public void setNextSs(String nextSs) {
        this.nextSs = nextSs;
    }

    public String getNextDd() {
        return nextDd;
    }

    public void setNextDd(String nextDd) {
        this.nextDd = nextDd;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public byte[] getFiledata() {
        return filedata;
    }

    public void setFiledata(byte[] filedata) {
        this.filedata = filedata;
    }

    public Date getInputdate() {
        return inputdate;
    }

    public void setInputdate(Date inputdate) {
        this.inputdate = inputdate;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
}